/**********************************************************************
 * File:        wordseg.cpp  (Formerly wspace.c)
 * Description: Code to segment the blobs into words.
 * Author:		Ray Smith
 * Created:		Fri Oct 16 11:32:28 BST 1992
 *
 * (C) Copyright 1992, Hewlett-Packard Ltd.
 ** Licensed under the Apache License, Version 2.0 (the "License");
 ** you may not use this file except in compliance with the License.
 ** You may obtain a copy of the License at
 ** http://www.apache.org/licenses/LICENSE-2.0
 ** Unless required by applicable law or agreed to in writing, software
 ** distributed under the License is distributed on an "AS IS" BASIS,
 ** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 ** See the License for the specific language governing permissions and
 ** limitations under the License.
 *
 **********************************************************************/

#include "mfcpch.h"
#ifdef __UNIX__
#include          <assert.h>
#endif
#include          "stderr.h"
#include          "blobbox.h"
#include          "ocrclass.h"
#include          "lmedsq.h"
#include          "statistc.h"
#include          "drawtord.h"
#include          "makerow.h"
#include          "pitsync1.h"
#include          "blobcmpl.h"
#include          "tovars.h"
#include          "topitch.h"
#include          "tospace.h"
#include          "fpchop.h"
#include          "wordseg.h"

#define EXTERN

EXTERN BOOL_VAR (textord_fp_chopping, TRUE, "Do fixed pitch chopping");
extern /*"C" */ ETEXT_DESC *global_monitor;     //progress monitor

#define FIXED_WIDTH_MULTIPLE  5
#define BLOCK_STATS_CLUSTERS  10

/**********************************************************************
 * make_words
 *
 * Arrange the blobs into words.
 **********************************************************************/

void make_words(                             //make words
                ICOORD page_tr,              //top right
                float gradient,              //page skew
                BLOCK_LIST *blocks,          //block list
                TO_BLOCK_LIST *land_blocks,  //rotated for landscape
                TO_BLOCK_LIST *port_blocks   //output list
               ) {
  TO_BLOCK_IT block_it;          //iterator
  TO_BLOCK *block;               //current block;

  compute_fixed_pitch (page_tr, port_blocks, gradient, FCOORD (0.0f, -1.0f),
    !(BOOL8) textord_test_landscape);
  if (global_monitor != NULL) {
    global_monitor->ocr_alive = TRUE;
    global_monitor->progress = 25;
  }
  to_spacing(page_tr, port_blocks);
  block_it.set_to_list (port_blocks);
  for (block_it.mark_cycle_pt (); !block_it.cycled_list ();
  block_it.forward ()) {
    block = block_it.data ();
    //              set_row_spaces(block,FCOORD(1,0),!(BOOL8)textord_test_landscape);
                                 //make proper classes
    make_real_words (block, FCOORD (1.0f, 0.0f));
  }
}


/**********************************************************************
 * set_row_spaces
 *
 * Set the min_space and max_nonspace members of the row so that
 * the blobs can be arranged into words.
 **********************************************************************/

void set_row_spaces(                  //find space sizes
                    TO_BLOCK *block,  //block to do
                    FCOORD rotation,  //for drawing
                    BOOL8 testing_on  //correct orientation
                   ) {
  inT32 maxwidth;                //of widest space
  TO_ROW *row;                   //current row
  TO_ROW_IT row_it = block->get_rows ();

  if (row_it.empty ())
    return;                      //empty block
  maxwidth = (inT32) ceil (block->xheight * textord_words_maxspace);
  for (row_it.mark_cycle_pt (); !row_it.cycled_list (); row_it.forward ()) {
    row = row_it.data ();
    if (row->fixed_pitch == 0) {
      //                      if (!textord_test_mode
      //                      && row_words(block,row,maxwidth,rotation,testing_on)==0
      //                      || textord_test_mode
      //                      && row_words2(block,row,maxwidth,rotation,testing_on)==0)
      //                      {
      row->min_space =
        (inT32) ceil (row->pr_space -
        (row->pr_space -
        row->pr_nonsp) * textord_words_definite_spread);
      row->max_nonspace =
        (inT32) floor (row->pr_nonsp +
        (row->pr_space -
        row->pr_nonsp) * textord_words_definite_spread);
      if (testing_on && textord_show_initial_words) {
        tprintf ("Assigning defaults %d non, %d space to row at %g\n",
          row->max_nonspace, row->min_space, row->intercept ());
      }
      row->space_threshold = (row->max_nonspace + row->min_space) / 2;
      row->space_size = row->pr_space;
      row->kern_size = row->pr_nonsp;
      //                      }
    }
#ifndef GRAPHICS_DISABLED
    if (textord_show_initial_words && testing_on) {
      plot_word_decisions (to_win, (inT16) row->fixed_pitch, row);
    }
#endif
  }
}


/**********************************************************************
 * row_words
 *
 * Compute the max nonspace and min space for the row.
 **********************************************************************/

inT32 row_words(                  //compute space size
                TO_BLOCK *block,  //block it came from
                TO_ROW *row,      //row to operate on
                inT32 maxwidth,   //max expected space size
                FCOORD rotation,  //for drawing
                BOOL8 testing_on  //for debug
               ) {
  BOOL8 testing_row;             //contains testpt
  BOOL8 prev_valid;              //if decent size
  BOOL8 this_valid;              //current blob big enough
  inT32 prev_x;                  //end of prev blob
  inT32 min_gap;                 //min interesting gap
  inT32 cluster_count;           //no of clusters
  inT32 gap_index;               //which cluster
  inT32 smooth_factor;           //for smoothing stats
  BLOBNBOX *blob;                //current blob
  float lower, upper;            //clustering parameters
  float gaps[3];                 //gap clusers
  ICOORD testpt;
  TBOX blob_box;                  //bounding box
                                 //iterator
  BLOBNBOX_IT blob_it = row->blob_list ();
  STATS gap_stats (0, maxwidth);
  STATS cluster_stats[4];        //clusters

  testpt = ICOORD (textord_test_x, textord_test_y);
  smooth_factor =
    (inT32) (block->xheight * textord_wordstats_smooth_factor + 1.5);
  //      if (testing_on)
  //              tprintf("Row smooth factor=%d\n",smooth_factor);
  prev_valid = FALSE;
  prev_x = -MAX_INT32;
  testing_row = FALSE;
  for (blob_it.mark_cycle_pt (); !blob_it.cycled_list (); blob_it.forward ()) {
    blob = blob_it.data ();
    blob_box = blob->bounding_box ();
    if (blob_box.contains (testpt))
      testing_row = TRUE;
    gap_stats.add (blob_box.width (), 1);
  }
  min_gap = (inT32) floor (gap_stats.ile (textord_words_width_ile));
  gap_stats.clear ();
  for (blob_it.mark_cycle_pt (); !blob_it.cycled_list (); blob_it.forward ()) {
    blob = blob_it.data ();
    if (!blob->joined_to_prev ()) {
      blob_box = blob->bounding_box ();
      //                      this_valid=blob_box.width()>=min_gap;
      this_valid = TRUE;
      if (this_valid && prev_valid
      && blob_box.left () - prev_x < maxwidth) {
        gap_stats.add (blob_box.left () - prev_x, 1);
      }
      prev_x = blob_box.right ();
      prev_valid = this_valid;
    }
  }
  if (gap_stats.get_total () == 0) {
    row->min_space = 0;          //no evidence
    row->max_nonspace = 0;
    return 0;
  }
  gap_stats.smooth (smooth_factor);
  lower = row->xheight * textord_words_initial_lower;
  upper = row->xheight * textord_words_initial_upper;
  cluster_count = gap_stats.cluster (lower, upper,
    textord_spacesize_ratioprop, 3,
    cluster_stats);
  while (cluster_count < 2 && ceil (lower) < floor (upper)) {
                                 //shrink gap
    upper = (upper * 3 + lower) / 4;
    lower = (lower * 3 + upper) / 4;
    cluster_count = gap_stats.cluster (lower, upper,
      textord_spacesize_ratioprop, 3,
      cluster_stats);
  }
  if (cluster_count < 2) {
    row->min_space = 0;          //no evidence
    row->max_nonspace = 0;
    return 0;
  }
  for (gap_index = 0; gap_index < cluster_count; gap_index++)
    gaps[gap_index] = cluster_stats[gap_index + 1].ile (0.5);
  //get medians
  if (cluster_count > 2) {
    if (testing_on && textord_show_initial_words) {
      tprintf ("Row at %g has 3 sizes of gap:%g,%g,%g\n",
        row->intercept (),
        cluster_stats[1].ile (0.5),
        cluster_stats[2].ile (0.5), cluster_stats[3].ile (0.5));
    }
    lower = gaps[0];
    if (gaps[1] > lower) {
      upper = gaps[1];           //prefer most frequent
      if (upper < block->xheight * textord_words_min_minspace
      && gaps[2] > gaps[1]) {
        upper = gaps[2];
      }
    }
    else if (gaps[2] > lower
      && gaps[2] >= block->xheight * textord_words_min_minspace)
      upper = gaps[2];
    else if (lower >= block->xheight * textord_words_min_minspace) {
      upper = lower;             //not nice
      lower = gaps[1];
      if (testing_on && textord_show_initial_words) {
        tprintf ("Had to switch most common from lower to upper!!\n");
        gap_stats.print (stdout, TRUE);
      }
    }
    else {
      row->min_space = 0;        //no evidence
      row->max_nonspace = 0;
      return 0;
    }
  }
  else {
    if (gaps[1] < gaps[0]) {
      if (testing_on && textord_show_initial_words) {
        tprintf ("Had to switch most common from lower to upper!!\n");
        gap_stats.print (stdout, TRUE);
      }
      lower = gaps[1];
      upper = gaps[0];
    }
    else {
      upper = gaps[1];
      lower = gaps[0];
    }
  }
  if (upper < block->xheight * textord_words_min_minspace) {
    row->min_space = 0;          //no evidence
    row->max_nonspace = 0;
    return 0;
  }
  if (upper * 3 < block->min_space * 2 + block->max_nonspace
  || lower * 3 > block->min_space * 2 + block->max_nonspace) {
    if (testing_on && textord_show_initial_words) {
      tprintf ("Disagreement between block and row at %g!!\n",
        row->intercept ());
      tprintf ("Lower=%g, upper=%g, Stats:\n", lower, upper);
      gap_stats.print (stdout, TRUE);
    }
  }
  row->min_space =
    (inT32) ceil (upper - (upper - lower) * textord_words_definite_spread);
  row->max_nonspace =
    (inT32) floor (lower + (upper - lower) * textord_words_definite_spread);
  row->space_threshold = (row->max_nonspace + row->min_space) / 2;
  row->space_size = upper;
  row->kern_size = lower;
  if (testing_on && textord_show_initial_words) {
    if (testing_row) {
      tprintf ("GAP STATS\n");
      gap_stats.print (stdout, TRUE);
      tprintf ("SPACE stats\n");
      cluster_stats[2].print (stdout, FALSE);
      tprintf ("NONSPACE stats\n");
      cluster_stats[1].print (stdout, FALSE);
    }
    tprintf ("Row at %g has minspace=%d(%g), max_non=%d(%g)\n",
      row->intercept (), row->min_space, upper,
      row->max_nonspace, lower);
  }
  return cluster_stats[2].get_total ();
}


/**********************************************************************
 * row_words2
 *
 * Compute the max nonspace and min space for the row.
 **********************************************************************/

inT32 row_words2(                  //compute space size
                 TO_BLOCK *block,  //block it came from
                 TO_ROW *row,      //row to operate on
                 inT32 maxwidth,   //max expected space size
                 FCOORD rotation,  //for drawing
                 BOOL8 testing_on  //for debug
                ) {
  BOOL8 testing_row;             //contains testpt
  BOOL8 prev_valid;              //if decent size
  BOOL8 this_valid;              //current blob big enough
  inT32 prev_x;                  //end of prev blob
  inT32 min_width;               //min interesting width
  inT32 valid_count;             //good gaps
  inT32 total_count;             //total gaps
  inT32 cluster_count;           //no of clusters
  inT32 prev_count;              //previous cluster_count
  inT32 gap_index;               //which cluster
  inT32 smooth_factor;           //for smoothing stats
  BLOBNBOX *blob;                //current blob
  float lower, upper;            //clustering parameters
  ICOORD testpt;
  TBOX blob_box;                  //bounding box
                                 //iterator
  BLOBNBOX_IT blob_it = row->blob_list ();
  STATS gap_stats (0, maxwidth);
                                 //gap sizes
  float gaps[BLOCK_STATS_CLUSTERS];
  STATS cluster_stats[BLOCK_STATS_CLUSTERS + 1];
  //clusters

  testpt = ICOORD (textord_test_x, textord_test_y);
  smooth_factor =
    (inT32) (block->xheight * textord_wordstats_smooth_factor + 1.5);
  //      if (testing_on)
  //              tprintf("Row smooth factor=%d\n",smooth_factor);
  prev_valid = FALSE;
  prev_x = -MAX_INT16;
  testing_row = FALSE;
                                 //min blob size
  min_width = (inT32) block->pr_space;
  total_count = 0;
  for (blob_it.mark_cycle_pt (); !blob_it.cycled_list (); blob_it.forward ()) {
    blob = blob_it.data ();
    if (!blob->joined_to_prev ()) {
      blob_box = blob->bounding_box ();
      this_valid = blob_box.width () >= min_width;
      this_valid = TRUE;
      if (this_valid && prev_valid
      && blob_box.left () - prev_x < maxwidth) {
        gap_stats.add (blob_box.left () - prev_x, 1);
      }
      total_count++;             //count possibles
      prev_x = blob_box.right ();
      prev_valid = this_valid;
    }
  }
  valid_count = gap_stats.get_total ();
  if (valid_count < total_count * textord_words_minlarge) {
    gap_stats.clear ();
    prev_x = -MAX_INT16;
    for (blob_it.mark_cycle_pt (); !blob_it.cycled_list ();
    blob_it.forward ()) {
      blob = blob_it.data ();
      if (!blob->joined_to_prev ()) {
        blob_box = blob->bounding_box ();
        if (blob_box.left () - prev_x < maxwidth) {
          gap_stats.add (blob_box.left () - prev_x, 1);
        }
        prev_x = blob_box.right ();
      }
    }
  }
  if (gap_stats.get_total () == 0) {
    row->min_space = 0;          //no evidence
    row->max_nonspace = 0;
    return 0;
  }

  cluster_count = 0;
  lower = block->xheight * words_initial_lower;
  upper = block->xheight * words_initial_upper;
  gap_stats.smooth (smooth_factor);
  do {
    prev_count = cluster_count;
    cluster_count = gap_stats.cluster (lower, upper,
      textord_spacesize_ratioprop,
      BLOCK_STATS_CLUSTERS, cluster_stats);
  }
  while (cluster_count > prev_count && cluster_count < BLOCK_STATS_CLUSTERS);
  if (cluster_count < 1) {
    row->min_space = 0;
    row->max_nonspace = 0;
    return 0;
  }
  for (gap_index = 0; gap_index < cluster_count; gap_index++)
    gaps[gap_index] = cluster_stats[gap_index + 1].ile (0.5);
  //get medians
  if (testing_on) {
    tprintf ("cluster_count=%d:", cluster_count);
    for (gap_index = 0; gap_index < cluster_count; gap_index++)
      tprintf (" %g(%d)", gaps[gap_index],
        cluster_stats[gap_index + 1].get_total ());
    tprintf ("\n");
  }

  //Try to find proportional non-space and space for row.
  for (gap_index = 0; gap_index < cluster_count
    && gaps[gap_index] > block->max_nonspace; gap_index++);
  if (gap_index < cluster_count)
    lower = gaps[gap_index];     //most frequent below
  else {
    if (testing_on)
      tprintf ("No cluster below block threshold!, using default=%g\n",
        block->pr_nonsp);
    lower = block->pr_nonsp;
  }
  for (gap_index = 0; gap_index < cluster_count
    && gaps[gap_index] <= block->max_nonspace; gap_index++);
  if (gap_index < cluster_count)
    upper = gaps[gap_index];     //most frequent above
  else {
    if (testing_on)
      tprintf ("No cluster above block threshold!, using default=%g\n",
        block->pr_space);
    upper = block->pr_space;
  }
  row->min_space =
    (inT32) ceil (upper - (upper - lower) * textord_words_definite_spread);
  row->max_nonspace =
    (inT32) floor (lower + (upper - lower) * textord_words_definite_spread);
  row->space_threshold = (row->max_nonspace + row->min_space) / 2;
  row->space_size = upper;
  row->kern_size = lower;
  if (testing_on) {
    if (testing_row) {
      tprintf ("GAP STATS\n");
      gap_stats.print (stdout, TRUE);
      tprintf ("SPACE stats\n");
      cluster_stats[2].print (stdout, FALSE);
      tprintf ("NONSPACE stats\n");
      cluster_stats[1].print (stdout, FALSE);
    }
    tprintf ("Row at %g has minspace=%d(%g), max_non=%d(%g)\n",
      row->intercept (), row->min_space, upper,
      row->max_nonspace, lower);
  }
  return 1;
}


/**********************************************************************
 * make_real_words
 *
 * Convert a TO_BLOCK to a BLOCK.
 **********************************************************************/

void make_real_words(                  //find lines
                     TO_BLOCK *block,  //block to do
                     FCOORD rotation   //for drawing
                    ) {
  TO_ROW *row;                   //current row
  TO_ROW_IT row_it = block->get_rows ();
  ROW *real_row = NULL;          //output row
  ROW_IT real_row_it = block->block->row_list ();

  if (row_it.empty ())
    return;                      //empty block
  for (row_it.mark_cycle_pt (); !row_it.cycled_list (); row_it.forward ()) {
    row = row_it.data ();
    if (row->blob_list ()->empty () && !row->rep_words.empty ()) {
      real_row = make_rep_words (row, block);
    }
    else if (!row->blob_list ()->empty ()) {
      //                      tprintf("Row pitch_decision=%d",row->pitch_decision);
      if (row->pitch_decision == PITCH_DEF_FIXED
        || row->pitch_decision == PITCH_CORR_FIXED)
        real_row = fixed_pitch_words (row, rotation);
      else if (row->pitch_decision == PITCH_DEF_PROP
        || row->pitch_decision == PITCH_CORR_PROP)
        real_row = make_prop_words (row, rotation);
      else
        ASSERT_HOST(FALSE);
    }
    if (real_row != NULL) {
                                 //put row in block
      real_row_it.add_after_then_move (real_row);
    }
  }
  block->block->set_stats (block->fixed_pitch == 0, (inT16) block->kern_size,
    (inT16) block->space_size,
    (inT16) block->fixed_pitch);
  block->block->check_pitch ();
}


/**********************************************************************
 * make_rep_words
 *
 * Fabricate a real row from only the repeated blob words.
 * Get the xheight from the block as it may be more meaningful.
 **********************************************************************/

ROW *make_rep_words(                 //make a row
                    TO_ROW *row,     //row to convert
                    TO_BLOCK *block  //block it lives in
                   ) {
  inT32 xstarts[2];              //ends of row
  ROW *real_row;                 //output row
  TBOX word_box;                  //bounding box
  double coeffs[3];              //spline
                                 //iterator
  WERD_IT word_it = &row->rep_words;

  if (word_it.empty ())
    return NULL;
  word_box = word_it.data ()->bounding_box ();
  for (word_it.mark_cycle_pt (); !word_it.cycled_list (); word_it.forward ())
    word_box += word_it.data ()->bounding_box ();
  xstarts[0] = word_box.left ();
  xstarts[1] = word_box.right ();
  coeffs[0] = 0;
  coeffs[1] = row->line_m ();
  coeffs[2] = row->line_c ();
  row->xheight = block->xheight;
  real_row = new ROW (row,
    (inT16) block->kern_size, (inT16) block->space_size);
  word_it.set_to_list (real_row->word_list ());
                                 //put words in row
  word_it.add_list_after (&row->rep_words);
  real_row->recalc_bounding_box ();
  return real_row;
}


/**********************************************************************
 * make_real_word
 *
 * Construct a WERD from a given number of adjacent entries in a
 * list of BLOBNBOXs.
 **********************************************************************/

WERD *make_real_word(                      //make a WERD
                     BLOBNBOX_IT *box_it,  //iterator
                     inT32 blobcount,      //no of blobs to use
                     BOOL8 bol,            //start of line
                     BOOL8 fuzzy_sp,       //fuzzy space
                     BOOL8 fuzzy_non,      //fuzzy non-space
                     uinT8 blanks          //no of blanks
                    ) {
  OUTLINE_IT out_it;             //outlines
  C_OUTLINE_IT cout_it;
  PBLOB_LIST blobs;              //blobs in word
  C_BLOB_LIST cblobs;
  PBLOB_IT blob_it = &blobs;     //iterator
  C_BLOB_IT cblob_it = &cblobs;
  WERD *word;                    //new word
  BLOBNBOX *bblob;               //current blob
  inT32 blobindex;               //in row

  for (blobindex = 0; blobindex < blobcount; blobindex++) {
    bblob = box_it->extract ();
    if (bblob->joined_to_prev ()) {
      if (bblob->blob () != NULL) {
        out_it.set_to_list (blob_it.data ()->out_list ());
        out_it.move_to_last ();
        out_it.add_list_after (bblob->blob ()->out_list ());
        delete bblob->blob ();
      }
      else if (bblob->cblob () != NULL) {
        cout_it.set_to_list (cblob_it.data ()->out_list ());
        cout_it.move_to_last ();
        cout_it.add_list_after (bblob->cblob ()->out_list ());
        delete bblob->cblob ();
      }
    }
    else {
      if (bblob->blob () != NULL)
        blob_it.add_after_then_move (bblob->blob ());
      else if (bblob->cblob () != NULL)
        cblob_it.add_after_then_move (bblob->cblob ());
    }
    delete bblob;
    box_it->forward ();          //next one
  }

  if (blanks < 1)
    blanks = 1;
  if (!blob_it.empty ()) {
                                 //make real word
    word = new WERD (&blobs, blanks, NULL);
  }
  else {
    word = new WERD (&cblobs, blanks, NULL);
  }
  if (bol) {
    word->set_flag (W_BOL, TRUE);
  }
  if (fuzzy_sp)
                                 //probably space
    word->set_flag (W_FUZZY_SP, TRUE);
  else if (fuzzy_non)
                                 //probably not
    word->set_flag (W_FUZZY_NON, TRUE);
  if (box_it->at_first ()) {
    word->set_flag (W_EOL, TRUE);//at end of line
  }
  return word;
}
