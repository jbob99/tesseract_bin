# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tesseract_bin}
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Danilo Jeremias da Silva}]
  s.date = %q{2012-01-31}
  s.description = %q{Gem binary of tesseract version 2.04}
  s.email = %q{dannnylo@gmail.com}
  s.extensions = [%q{ext/tesseract_bin/extconf.rb}]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "ext/tesseract_bin/extconf.rb",
    "lib/tesseract_bin.rb",
    "tessdata/Makefile.am",
    "tessdata/Makefile.in",
    "tessdata/configs/Makefile.am",
    "tessdata/configs/Makefile.in",
    "tessdata/configs/api_config",
    "tessdata/configs/box.train",
    "tessdata/configs/box.train.stderr",
    "tessdata/configs/inter",
    "tessdata/configs/kannada",
    "tessdata/configs/makebox",
    "tessdata/configs/unlv",
    "tessdata/confsets",
    "tessdata/eng.DangAmbigs",
    "tessdata/eng.freq-dawg",
    "tessdata/eng.inttemp",
    "tessdata/eng.normproto",
    "tessdata/eng.pffmtable",
    "tessdata/eng.unicharset",
    "tessdata/eng.user-words",
    "tessdata/eng.word-dawg",
    "tessdata/makedummies",
    "tessdata/tessconfigs/Makefile.am",
    "tessdata/tessconfigs/Makefile.in",
    "tessdata/tessconfigs/batch",
    "tessdata/tessconfigs/batch.nochop",
    "tessdata/tessconfigs/matdemo",
    "tessdata/tessconfigs/msdemo",
    "tessdata/tessconfigs/nobatch",
    "tessdata/tessconfigs/segdemo",
    "tesseract_bin.gemspec",
    "test/helper.rb",
    "test/test_tesseract_bin.rb",
    "vendor/tesseract-2.04/AUTHORS",
    "vendor/tesseract-2.04/COPYING",
    "vendor/tesseract-2.04/ChangeLog",
    "vendor/tesseract-2.04/INSTALL",
    "vendor/tesseract-2.04/Makefile.am",
    "vendor/tesseract-2.04/Makefile.in",
    "vendor/tesseract-2.04/NEWS",
    "vendor/tesseract-2.04/README",
    "vendor/tesseract-2.04/ReleaseNotes",
    "vendor/tesseract-2.04/StdAfx.cpp",
    "vendor/tesseract-2.04/StdAfx.h",
    "vendor/tesseract-2.04/ccmain/Makefile.am",
    "vendor/tesseract-2.04/ccmain/Makefile.in",
    "vendor/tesseract-2.04/ccmain/adaptions.cpp",
    "vendor/tesseract-2.04/ccmain/adaptions.h",
    "vendor/tesseract-2.04/ccmain/applybox.cpp",
    "vendor/tesseract-2.04/ccmain/applybox.h",
    "vendor/tesseract-2.04/ccmain/baseapi.cpp",
    "vendor/tesseract-2.04/ccmain/baseapi.h",
    "vendor/tesseract-2.04/ccmain/blobcmp.cpp",
    "vendor/tesseract-2.04/ccmain/blobcmp.h",
    "vendor/tesseract-2.04/ccmain/callnet.cpp",
    "vendor/tesseract-2.04/ccmain/callnet.h",
    "vendor/tesseract-2.04/ccmain/charcut.cpp",
    "vendor/tesseract-2.04/ccmain/charcut.h",
    "vendor/tesseract-2.04/ccmain/charsample.cpp",
    "vendor/tesseract-2.04/ccmain/control.cpp",
    "vendor/tesseract-2.04/ccmain/control.h",
    "vendor/tesseract-2.04/ccmain/docqual.cpp",
    "vendor/tesseract-2.04/ccmain/docqual.h",
    "vendor/tesseract-2.04/ccmain/expandblob.cpp",
    "vendor/tesseract-2.04/ccmain/expandblob.h",
    "vendor/tesseract-2.04/ccmain/fixspace.cpp",
    "vendor/tesseract-2.04/ccmain/fixspace.h",
    "vendor/tesseract-2.04/ccmain/fixxht.cpp",
    "vendor/tesseract-2.04/ccmain/fixxht.h",
    "vendor/tesseract-2.04/ccmain/imgscale.cpp",
    "vendor/tesseract-2.04/ccmain/imgscale.h",
    "vendor/tesseract-2.04/ccmain/matmatch.cpp",
    "vendor/tesseract-2.04/ccmain/matmatch.h",
    "vendor/tesseract-2.04/ccmain/output.cpp",
    "vendor/tesseract-2.04/ccmain/output.h",
    "vendor/tesseract-2.04/ccmain/pagewalk.cpp",
    "vendor/tesseract-2.04/ccmain/pagewalk.h",
    "vendor/tesseract-2.04/ccmain/paircmp.cpp",
    "vendor/tesseract-2.04/ccmain/paircmp.h",
    "vendor/tesseract-2.04/ccmain/pgedit.cpp",
    "vendor/tesseract-2.04/ccmain/pgedit.h",
    "vendor/tesseract-2.04/ccmain/reject.cpp",
    "vendor/tesseract-2.04/ccmain/reject.h",
    "vendor/tesseract-2.04/ccmain/scaleimg.cpp",
    "vendor/tesseract-2.04/ccmain/scaleimg.h",
    "vendor/tesseract-2.04/ccmain/tessbox.cpp",
    "vendor/tesseract-2.04/ccmain/tessbox.h",
    "vendor/tesseract-2.04/ccmain/tessedit.cpp",
    "vendor/tesseract-2.04/ccmain/tessedit.h",
    "vendor/tesseract-2.04/ccmain/tessembedded.cpp",
    "vendor/tesseract-2.04/ccmain/tessembedded.h",
    "vendor/tesseract-2.04/ccmain/tesseractfull.cc",
    "vendor/tesseract-2.04/ccmain/tesseractmain.cpp",
    "vendor/tesseract-2.04/ccmain/tesseractmain.h",
    "vendor/tesseract-2.04/ccmain/tessio.h",
    "vendor/tesseract-2.04/ccmain/tessvars.cpp",
    "vendor/tesseract-2.04/ccmain/tessvars.h",
    "vendor/tesseract-2.04/ccmain/tfacep.h",
    "vendor/tesseract-2.04/ccmain/tfacepp.cpp",
    "vendor/tesseract-2.04/ccmain/tfacepp.h",
    "vendor/tesseract-2.04/ccmain/tstruct.cpp",
    "vendor/tesseract-2.04/ccmain/tstruct.h",
    "vendor/tesseract-2.04/ccmain/varabled.cpp",
    "vendor/tesseract-2.04/ccmain/varabled.h",
    "vendor/tesseract-2.04/ccmain/werdit.cpp",
    "vendor/tesseract-2.04/ccmain/werdit.h",
    "vendor/tesseract-2.04/ccstruct/Makefile.am",
    "vendor/tesseract-2.04/ccstruct/Makefile.in",
    "vendor/tesseract-2.04/ccstruct/blckerr.h",
    "vendor/tesseract-2.04/ccstruct/blobbox.cpp",
    "vendor/tesseract-2.04/ccstruct/blobbox.h",
    "vendor/tesseract-2.04/ccstruct/blobs.cpp",
    "vendor/tesseract-2.04/ccstruct/blobs.h",
    "vendor/tesseract-2.04/ccstruct/blread.cpp",
    "vendor/tesseract-2.04/ccstruct/blread.h",
    "vendor/tesseract-2.04/ccstruct/callcpp.cpp",
    "vendor/tesseract-2.04/ccstruct/coutln.cpp",
    "vendor/tesseract-2.04/ccstruct/coutln.h",
    "vendor/tesseract-2.04/ccstruct/crakedge.h",
    "vendor/tesseract-2.04/ccstruct/genblob.cpp",
    "vendor/tesseract-2.04/ccstruct/genblob.h",
    "vendor/tesseract-2.04/ccstruct/hpddef.h",
    "vendor/tesseract-2.04/ccstruct/hpdsizes.h",
    "vendor/tesseract-2.04/ccstruct/ipoints.h",
    "vendor/tesseract-2.04/ccstruct/labls.cpp",
    "vendor/tesseract-2.04/ccstruct/labls.h",
    "vendor/tesseract-2.04/ccstruct/linlsq.cpp",
    "vendor/tesseract-2.04/ccstruct/linlsq.h",
    "vendor/tesseract-2.04/ccstruct/lmedsq.cpp",
    "vendor/tesseract-2.04/ccstruct/lmedsq.h",
    "vendor/tesseract-2.04/ccstruct/mod128.cpp",
    "vendor/tesseract-2.04/ccstruct/mod128.h",
    "vendor/tesseract-2.04/ccstruct/normalis.cpp",
    "vendor/tesseract-2.04/ccstruct/normalis.h",
    "vendor/tesseract-2.04/ccstruct/ocrblock.cpp",
    "vendor/tesseract-2.04/ccstruct/ocrblock.h",
    "vendor/tesseract-2.04/ccstruct/ocrrow.cpp",
    "vendor/tesseract-2.04/ccstruct/ocrrow.h",
    "vendor/tesseract-2.04/ccstruct/pageblk.cpp",
    "vendor/tesseract-2.04/ccstruct/pageblk.h",
    "vendor/tesseract-2.04/ccstruct/pageres.cpp",
    "vendor/tesseract-2.04/ccstruct/pageres.h",
    "vendor/tesseract-2.04/ccstruct/pdblock.cpp",
    "vendor/tesseract-2.04/ccstruct/pdblock.h",
    "vendor/tesseract-2.04/ccstruct/pdclass.h",
    "vendor/tesseract-2.04/ccstruct/points.cpp",
    "vendor/tesseract-2.04/ccstruct/points.h",
    "vendor/tesseract-2.04/ccstruct/polyaprx.cpp",
    "vendor/tesseract-2.04/ccstruct/polyaprx.h",
    "vendor/tesseract-2.04/ccstruct/polyblk.cpp",
    "vendor/tesseract-2.04/ccstruct/polyblk.h",
    "vendor/tesseract-2.04/ccstruct/polyblob.cpp",
    "vendor/tesseract-2.04/ccstruct/polyblob.h",
    "vendor/tesseract-2.04/ccstruct/polyvert.cpp",
    "vendor/tesseract-2.04/ccstruct/polyvert.h",
    "vendor/tesseract-2.04/ccstruct/poutline.cpp",
    "vendor/tesseract-2.04/ccstruct/poutline.h",
    "vendor/tesseract-2.04/ccstruct/quadlsq.cpp",
    "vendor/tesseract-2.04/ccstruct/quadlsq.h",
    "vendor/tesseract-2.04/ccstruct/quadratc.cpp",
    "vendor/tesseract-2.04/ccstruct/quadratc.h",
    "vendor/tesseract-2.04/ccstruct/quspline.cpp",
    "vendor/tesseract-2.04/ccstruct/quspline.h",
    "vendor/tesseract-2.04/ccstruct/ratngs.cpp",
    "vendor/tesseract-2.04/ccstruct/ratngs.h",
    "vendor/tesseract-2.04/ccstruct/rect.cpp",
    "vendor/tesseract-2.04/ccstruct/rect.h",
    "vendor/tesseract-2.04/ccstruct/rejctmap.cpp",
    "vendor/tesseract-2.04/ccstruct/rejctmap.h",
    "vendor/tesseract-2.04/ccstruct/rwpoly.cpp",
    "vendor/tesseract-2.04/ccstruct/rwpoly.h",
    "vendor/tesseract-2.04/ccstruct/statistc.cpp",
    "vendor/tesseract-2.04/ccstruct/statistc.h",
    "vendor/tesseract-2.04/ccstruct/stepblob.cpp",
    "vendor/tesseract-2.04/ccstruct/stepblob.h",
    "vendor/tesseract-2.04/ccstruct/txtregn.cpp",
    "vendor/tesseract-2.04/ccstruct/txtregn.h",
    "vendor/tesseract-2.04/ccstruct/vecfuncs.cpp",
    "vendor/tesseract-2.04/ccstruct/vecfuncs.h",
    "vendor/tesseract-2.04/ccstruct/werd.cpp",
    "vendor/tesseract-2.04/ccstruct/werd.h",
    "vendor/tesseract-2.04/ccutil/Makefile.am",
    "vendor/tesseract-2.04/ccutil/Makefile.in",
    "vendor/tesseract-2.04/ccutil/basedir.cpp",
    "vendor/tesseract-2.04/ccutil/basedir.h",
    "vendor/tesseract-2.04/ccutil/bits16.cpp",
    "vendor/tesseract-2.04/ccutil/bits16.h",
    "vendor/tesseract-2.04/ccutil/boxread.cpp",
    "vendor/tesseract-2.04/ccutil/boxread.h",
    "vendor/tesseract-2.04/ccutil/clst.cpp",
    "vendor/tesseract-2.04/ccutil/clst.h",
    "vendor/tesseract-2.04/ccutil/debugwin.cpp",
    "vendor/tesseract-2.04/ccutil/debugwin.h",
    "vendor/tesseract-2.04/ccutil/elst.cpp",
    "vendor/tesseract-2.04/ccutil/elst.h",
    "vendor/tesseract-2.04/ccutil/elst2.cpp",
    "vendor/tesseract-2.04/ccutil/elst2.h",
    "vendor/tesseract-2.04/ccutil/errcode.cpp",
    "vendor/tesseract-2.04/ccutil/errcode.h",
    "vendor/tesseract-2.04/ccutil/fileerr.h",
    "vendor/tesseract-2.04/ccutil/globaloc.cpp",
    "vendor/tesseract-2.04/ccutil/globaloc.h",
    "vendor/tesseract-2.04/ccutil/hashfn.cpp",
    "vendor/tesseract-2.04/ccutil/hashfn.h",
    "vendor/tesseract-2.04/ccutil/host.h",
    "vendor/tesseract-2.04/ccutil/hosthplb.h",
    "vendor/tesseract-2.04/ccutil/lsterr.h",
    "vendor/tesseract-2.04/ccutil/mainblk.cpp",
    "vendor/tesseract-2.04/ccutil/mainblk.h",
    "vendor/tesseract-2.04/ccutil/memblk.cpp",
    "vendor/tesseract-2.04/ccutil/memblk.h",
    "vendor/tesseract-2.04/ccutil/memry.cpp",
    "vendor/tesseract-2.04/ccutil/memry.h",
    "vendor/tesseract-2.04/ccutil/memryerr.h",
    "vendor/tesseract-2.04/ccutil/mfcpch.cpp",
    "vendor/tesseract-2.04/ccutil/mfcpch.h",
    "vendor/tesseract-2.04/ccutil/ndminx.h",
    "vendor/tesseract-2.04/ccutil/notdll.h",
    "vendor/tesseract-2.04/ccutil/nwmain.h",
    "vendor/tesseract-2.04/ccutil/ocrclass.h",
    "vendor/tesseract-2.04/ccutil/ocrshell.cpp",
    "vendor/tesseract-2.04/ccutil/ocrshell.h",
    "vendor/tesseract-2.04/ccutil/platform.h",
    "vendor/tesseract-2.04/ccutil/scanutils.cpp",
    "vendor/tesseract-2.04/ccutil/scanutils.h",
    "vendor/tesseract-2.04/ccutil/secname.h",
    "vendor/tesseract-2.04/ccutil/serialis.cpp",
    "vendor/tesseract-2.04/ccutil/serialis.h",
    "vendor/tesseract-2.04/ccutil/stderr.h",
    "vendor/tesseract-2.04/ccutil/strngs.cpp",
    "vendor/tesseract-2.04/ccutil/strngs.h",
    "vendor/tesseract-2.04/ccutil/tessclas.h",
    "vendor/tesseract-2.04/ccutil/tessopt.cpp",
    "vendor/tesseract-2.04/ccutil/tessopt.h",
    "vendor/tesseract-2.04/ccutil/tprintf.cpp",
    "vendor/tesseract-2.04/ccutil/tprintf.h",
    "vendor/tesseract-2.04/ccutil/unichar.cpp",
    "vendor/tesseract-2.04/ccutil/unichar.h",
    "vendor/tesseract-2.04/ccutil/unicharmap.cpp",
    "vendor/tesseract-2.04/ccutil/unicharmap.h",
    "vendor/tesseract-2.04/ccutil/unicharset.cpp",
    "vendor/tesseract-2.04/ccutil/unicharset.h",
    "vendor/tesseract-2.04/ccutil/varable.cpp",
    "vendor/tesseract-2.04/ccutil/varable.h",
    "vendor/tesseract-2.04/classify/Makefile.am",
    "vendor/tesseract-2.04/classify/Makefile.in",
    "vendor/tesseract-2.04/classify/adaptive.cpp",
    "vendor/tesseract-2.04/classify/adaptive.h",
    "vendor/tesseract-2.04/classify/adaptmatch.cpp",
    "vendor/tesseract-2.04/classify/adaptmatch.h",
    "vendor/tesseract-2.04/classify/baseline.cpp",
    "vendor/tesseract-2.04/classify/baseline.h",
    "vendor/tesseract-2.04/classify/blobclass.cpp",
    "vendor/tesseract-2.04/classify/blobclass.h",
    "vendor/tesseract-2.04/classify/chartoname.cpp",
    "vendor/tesseract-2.04/classify/chartoname.h",
    "vendor/tesseract-2.04/classify/cluster.cpp",
    "vendor/tesseract-2.04/classify/cluster.h",
    "vendor/tesseract-2.04/classify/clusttool.cpp",
    "vendor/tesseract-2.04/classify/clusttool.h",
    "vendor/tesseract-2.04/classify/cutoffs.cpp",
    "vendor/tesseract-2.04/classify/cutoffs.h",
    "vendor/tesseract-2.04/classify/extern.h",
    "vendor/tesseract-2.04/classify/extract.cpp",
    "vendor/tesseract-2.04/classify/extract.h",
    "vendor/tesseract-2.04/classify/featdefs.cpp",
    "vendor/tesseract-2.04/classify/featdefs.h",
    "vendor/tesseract-2.04/classify/flexfx.cpp",
    "vendor/tesseract-2.04/classify/flexfx.h",
    "vendor/tesseract-2.04/classify/float2int.cpp",
    "vendor/tesseract-2.04/classify/float2int.h",
    "vendor/tesseract-2.04/classify/fpoint.cpp",
    "vendor/tesseract-2.04/classify/fpoint.h",
    "vendor/tesseract-2.04/classify/fxdefs.cpp",
    "vendor/tesseract-2.04/classify/fxdefs.h",
    "vendor/tesseract-2.04/classify/fxid.h",
    "vendor/tesseract-2.04/classify/hideedge.cpp",
    "vendor/tesseract-2.04/classify/hideedge.h",
    "vendor/tesseract-2.04/classify/intfx.cpp",
    "vendor/tesseract-2.04/classify/intfx.h",
    "vendor/tesseract-2.04/classify/intmatcher.cpp",
    "vendor/tesseract-2.04/classify/intmatcher.h",
    "vendor/tesseract-2.04/classify/intproto.cpp",
    "vendor/tesseract-2.04/classify/intproto.h",
    "vendor/tesseract-2.04/classify/kdtree.cpp",
    "vendor/tesseract-2.04/classify/kdtree.h",
    "vendor/tesseract-2.04/classify/mf.cpp",
    "vendor/tesseract-2.04/classify/mf.h",
    "vendor/tesseract-2.04/classify/mfdefs.cpp",
    "vendor/tesseract-2.04/classify/mfdefs.h",
    "vendor/tesseract-2.04/classify/mfoutline.cpp",
    "vendor/tesseract-2.04/classify/mfoutline.h",
    "vendor/tesseract-2.04/classify/mfx.cpp",
    "vendor/tesseract-2.04/classify/mfx.h",
    "vendor/tesseract-2.04/classify/normfeat.cpp",
    "vendor/tesseract-2.04/classify/normfeat.h",
    "vendor/tesseract-2.04/classify/normmatch.cpp",
    "vendor/tesseract-2.04/classify/normmatch.h",
    "vendor/tesseract-2.04/classify/ocrfeatures.cpp",
    "vendor/tesseract-2.04/classify/ocrfeatures.h",
    "vendor/tesseract-2.04/classify/outfeat.cpp",
    "vendor/tesseract-2.04/classify/outfeat.h",
    "vendor/tesseract-2.04/classify/picofeat.cpp",
    "vendor/tesseract-2.04/classify/picofeat.h",
    "vendor/tesseract-2.04/classify/protos.cpp",
    "vendor/tesseract-2.04/classify/protos.h",
    "vendor/tesseract-2.04/classify/sigmenu.cpp",
    "vendor/tesseract-2.04/classify/sigmenu.h",
    "vendor/tesseract-2.04/classify/speckle.cpp",
    "vendor/tesseract-2.04/classify/speckle.h",
    "vendor/tesseract-2.04/classify/xform2d.cpp",
    "vendor/tesseract-2.04/classify/xform2d.h",
    "vendor/tesseract-2.04/config/config.guess",
    "vendor/tesseract-2.04/config/config.h.in",
    "vendor/tesseract-2.04/config/config.sub",
    "vendor/tesseract-2.04/config/depcomp",
    "vendor/tesseract-2.04/config/install-sh",
    "vendor/tesseract-2.04/config/missing",
    "vendor/tesseract-2.04/config/mkinstalldirs",
    "vendor/tesseract-2.04/config/stamp-h.in",
    "vendor/tesseract-2.04/configure",
    "vendor/tesseract-2.04/cutil/Makefile.am",
    "vendor/tesseract-2.04/cutil/Makefile.in",
    "vendor/tesseract-2.04/cutil/bitvec.cpp",
    "vendor/tesseract-2.04/cutil/bitvec.h",
    "vendor/tesseract-2.04/cutil/callcpp.h",
    "vendor/tesseract-2.04/cutil/const.h",
    "vendor/tesseract-2.04/cutil/cutil.cpp",
    "vendor/tesseract-2.04/cutil/cutil.h",
    "vendor/tesseract-2.04/cutil/danerror.cpp",
    "vendor/tesseract-2.04/cutil/danerror.h",
    "vendor/tesseract-2.04/cutil/debug.cpp",
    "vendor/tesseract-2.04/cutil/debug.h",
    "vendor/tesseract-2.04/cutil/efio.cpp",
    "vendor/tesseract-2.04/cutil/efio.h",
    "vendor/tesseract-2.04/cutil/emalloc.cpp",
    "vendor/tesseract-2.04/cutil/emalloc.h",
    "vendor/tesseract-2.04/cutil/freelist.cpp",
    "vendor/tesseract-2.04/cutil/freelist.h",
    "vendor/tesseract-2.04/cutil/funcdefs.h",
    "vendor/tesseract-2.04/cutil/general.h",
    "vendor/tesseract-2.04/cutil/globals.cpp",
    "vendor/tesseract-2.04/cutil/globals.h",
    "vendor/tesseract-2.04/cutil/listio.cpp",
    "vendor/tesseract-2.04/cutil/listio.h",
    "vendor/tesseract-2.04/cutil/minmax.h",
    "vendor/tesseract-2.04/cutil/oldheap.cpp",
    "vendor/tesseract-2.04/cutil/oldheap.h",
    "vendor/tesseract-2.04/cutil/oldlist.cpp",
    "vendor/tesseract-2.04/cutil/oldlist.h",
    "vendor/tesseract-2.04/cutil/structures.cpp",
    "vendor/tesseract-2.04/cutil/structures.h",
    "vendor/tesseract-2.04/cutil/tessarray.cpp",
    "vendor/tesseract-2.04/cutil/tessarray.h",
    "vendor/tesseract-2.04/cutil/tordvars.cpp",
    "vendor/tesseract-2.04/cutil/tordvars.h",
    "vendor/tesseract-2.04/cutil/variables.cpp",
    "vendor/tesseract-2.04/cutil/variables.h",
    "vendor/tesseract-2.04/dict/Makefile.am",
    "vendor/tesseract-2.04/dict/Makefile.in",
    "vendor/tesseract-2.04/dict/choicearr.h",
    "vendor/tesseract-2.04/dict/choices.cpp",
    "vendor/tesseract-2.04/dict/choices.h",
    "vendor/tesseract-2.04/dict/context.cpp",
    "vendor/tesseract-2.04/dict/context.h",
    "vendor/tesseract-2.04/dict/dawg.cpp",
    "vendor/tesseract-2.04/dict/dawg.h",
    "vendor/tesseract-2.04/dict/hyphen.cpp",
    "vendor/tesseract-2.04/dict/hyphen.h",
    "vendor/tesseract-2.04/dict/lookdawg.cpp",
    "vendor/tesseract-2.04/dict/lookdawg.h",
    "vendor/tesseract-2.04/dict/makedawg.cpp",
    "vendor/tesseract-2.04/dict/makedawg.h",
    "vendor/tesseract-2.04/dict/matchdefs.h",
    "vendor/tesseract-2.04/dict/permdawg.cpp",
    "vendor/tesseract-2.04/dict/permdawg.h",
    "vendor/tesseract-2.04/dict/permngram.cpp",
    "vendor/tesseract-2.04/dict/permngram.h",
    "vendor/tesseract-2.04/dict/permnum.cpp",
    "vendor/tesseract-2.04/dict/permnum.h",
    "vendor/tesseract-2.04/dict/permute.cpp",
    "vendor/tesseract-2.04/dict/permute.h",
    "vendor/tesseract-2.04/dict/reduce.cpp",
    "vendor/tesseract-2.04/dict/reduce.h",
    "vendor/tesseract-2.04/dict/states.cpp",
    "vendor/tesseract-2.04/dict/states.h",
    "vendor/tesseract-2.04/dict/stopper.cpp",
    "vendor/tesseract-2.04/dict/stopper.h",
    "vendor/tesseract-2.04/dict/trie.cpp",
    "vendor/tesseract-2.04/dict/trie.h",
    "vendor/tesseract-2.04/dlltest/Makefile.am",
    "vendor/tesseract-2.04/dlltest/Makefile.in",
    "vendor/tesseract-2.04/dlltest/dlltest.cpp",
    "vendor/tesseract-2.04/dlltest/dlltest.dsp",
    "vendor/tesseract-2.04/dlltest/dlltest.vcproj",
    "vendor/tesseract-2.04/eurotext.tif",
    "vendor/tesseract-2.04/image/Makefile.am",
    "vendor/tesseract-2.04/image/Makefile.in",
    "vendor/tesseract-2.04/image/bitstrm.cpp",
    "vendor/tesseract-2.04/image/bitstrm.h",
    "vendor/tesseract-2.04/image/img.h",
    "vendor/tesseract-2.04/image/imgbmp.cpp",
    "vendor/tesseract-2.04/image/imgbmp.h",
    "vendor/tesseract-2.04/image/imgerrs.h",
    "vendor/tesseract-2.04/image/imgio.cpp",
    "vendor/tesseract-2.04/image/imgio.h",
    "vendor/tesseract-2.04/image/imgs.cpp",
    "vendor/tesseract-2.04/image/imgs.h",
    "vendor/tesseract-2.04/image/imgtiff.cpp",
    "vendor/tesseract-2.04/image/imgtiff.h",
    "vendor/tesseract-2.04/image/imgunpk.h",
    "vendor/tesseract-2.04/image/svshowim.cpp",
    "vendor/tesseract-2.04/image/svshowim.h",
    "vendor/tesseract-2.04/java/Makefile.am",
    "vendor/tesseract-2.04/java/Makefile.in",
    "vendor/tesseract-2.04/java/com/Makefile.am",
    "vendor/tesseract-2.04/java/com/Makefile.in",
    "vendor/tesseract-2.04/java/com/google/Makefile.am",
    "vendor/tesseract-2.04/java/com/google/Makefile.in",
    "vendor/tesseract-2.04/java/com/google/scrollview/Makefile.am",
    "vendor/tesseract-2.04/java/com/google/scrollview/Makefile.in",
    "vendor/tesseract-2.04/java/com/google/scrollview/ScrollView.java",
    "vendor/tesseract-2.04/java/com/google/scrollview/events/Makefile.am",
    "vendor/tesseract-2.04/java/com/google/scrollview/events/Makefile.in",
    "vendor/tesseract-2.04/java/com/google/scrollview/events/SVEvent.java",
    "vendor/tesseract-2.04/java/com/google/scrollview/events/SVEventHandler.java",
    "vendor/tesseract-2.04/java/com/google/scrollview/events/SVEventType.java",
    "vendor/tesseract-2.04/java/com/google/scrollview/ui/Makefile.am",
    "vendor/tesseract-2.04/java/com/google/scrollview/ui/Makefile.in",
    "vendor/tesseract-2.04/java/com/google/scrollview/ui/SVAbstractMenuItem.java",
    "vendor/tesseract-2.04/java/com/google/scrollview/ui/SVCheckboxMenuItem.java",
    "vendor/tesseract-2.04/java/com/google/scrollview/ui/SVEmptyMenuItem.java",
    "vendor/tesseract-2.04/java/com/google/scrollview/ui/SVImageHandler.java",
    "vendor/tesseract-2.04/java/com/google/scrollview/ui/SVMenuBar.java",
    "vendor/tesseract-2.04/java/com/google/scrollview/ui/SVMenuItem.java",
    "vendor/tesseract-2.04/java/com/google/scrollview/ui/SVPopupMenu.java",
    "vendor/tesseract-2.04/java/com/google/scrollview/ui/SVSubMenuItem.java",
    "vendor/tesseract-2.04/java/com/google/scrollview/ui/SVWindow.java",
    "vendor/tesseract-2.04/java/makefile",
    "vendor/tesseract-2.04/pageseg/Makefile.am",
    "vendor/tesseract-2.04/pageseg/Makefile.in",
    "vendor/tesseract-2.04/pageseg/leptonica_pageseg.cpp",
    "vendor/tesseract-2.04/pageseg/leptonica_pageseg.h",
    "vendor/tesseract-2.04/pageseg/leptonica_pageseg_interface.cpp",
    "vendor/tesseract-2.04/pageseg/leptonica_pageseg_interface.h",
    "vendor/tesseract-2.04/pageseg/pageseg.cpp",
    "vendor/tesseract-2.04/pageseg/pageseg.h",
    "vendor/tesseract-2.04/phototest.tif",
    "vendor/tesseract-2.04/tessdata/Makefile.am",
    "vendor/tesseract-2.04/tessdata/Makefile.in",
    "vendor/tesseract-2.04/tessdata/configs/Makefile.am",
    "vendor/tesseract-2.04/tessdata/configs/Makefile.in",
    "vendor/tesseract-2.04/tessdata/configs/api_config",
    "vendor/tesseract-2.04/tessdata/configs/box.train",
    "vendor/tesseract-2.04/tessdata/configs/box.train.stderr",
    "vendor/tesseract-2.04/tessdata/configs/inter",
    "vendor/tesseract-2.04/tessdata/configs/kannada",
    "vendor/tesseract-2.04/tessdata/configs/makebox",
    "vendor/tesseract-2.04/tessdata/configs/unlv",
    "vendor/tesseract-2.04/tessdata/confsets",
    "vendor/tesseract-2.04/tessdata/eng.DangAmbigs",
    "vendor/tesseract-2.04/tessdata/eng.freq-dawg",
    "vendor/tesseract-2.04/tessdata/eng.inttemp",
    "vendor/tesseract-2.04/tessdata/eng.normproto",
    "vendor/tesseract-2.04/tessdata/eng.pffmtable",
    "vendor/tesseract-2.04/tessdata/eng.unicharset",
    "vendor/tesseract-2.04/tessdata/eng.user-words",
    "vendor/tesseract-2.04/tessdata/eng.word-dawg",
    "vendor/tesseract-2.04/tessdata/makedummies",
    "vendor/tesseract-2.04/tessdata/tessconfigs/Makefile.am",
    "vendor/tesseract-2.04/tessdata/tessconfigs/Makefile.in",
    "vendor/tesseract-2.04/tessdata/tessconfigs/batch",
    "vendor/tesseract-2.04/tessdata/tessconfigs/batch.nochop",
    "vendor/tesseract-2.04/tessdata/tessconfigs/matdemo",
    "vendor/tesseract-2.04/tessdata/tessconfigs/msdemo",
    "vendor/tesseract-2.04/tessdata/tessconfigs/nobatch",
    "vendor/tesseract-2.04/tessdata/tessconfigs/segdemo",
    "vendor/tesseract-2.04/tessdll.cpp",
    "vendor/tesseract-2.04/tessdll.dsp",
    "vendor/tesseract-2.04/tessdll.h",
    "vendor/tesseract-2.04/tessdll.vcproj",
    "vendor/tesseract-2.04/tesseract.dsp",
    "vendor/tesseract-2.04/tesseract.dsw",
    "vendor/tesseract-2.04/tesseract.sln",
    "vendor/tesseract-2.04/tesseract.spec",
    "vendor/tesseract-2.04/tesseract.vcproj",
    "vendor/tesseract-2.04/testing/Makefile.am",
    "vendor/tesseract-2.04/testing/Makefile.in",
    "vendor/tesseract-2.04/testing/README",
    "vendor/tesseract-2.04/testing/counttestset.sh",
    "vendor/tesseract-2.04/testing/reorgdata.sh",
    "vendor/tesseract-2.04/testing/reports/1995.bus.3B.sum",
    "vendor/tesseract-2.04/testing/reports/1995.doe3.3B.sum",
    "vendor/tesseract-2.04/testing/reports/1995.mag.3B.sum",
    "vendor/tesseract-2.04/testing/reports/1995.news.3B.sum",
    "vendor/tesseract-2.04/testing/reports/2.03.summary",
    "vendor/tesseract-2.04/testing/reports/2.04.summary",
    "vendor/tesseract-2.04/testing/runalltests.sh",
    "vendor/tesseract-2.04/testing/runtestset.sh",
    "vendor/tesseract-2.04/textord/Makefile.am",
    "vendor/tesseract-2.04/textord/Makefile.in",
    "vendor/tesseract-2.04/textord/blkocc.cpp",
    "vendor/tesseract-2.04/textord/blkocc.h",
    "vendor/tesseract-2.04/textord/blobcmpl.h",
    "vendor/tesseract-2.04/textord/drawedg.cpp",
    "vendor/tesseract-2.04/textord/drawedg.h",
    "vendor/tesseract-2.04/textord/drawtord.cpp",
    "vendor/tesseract-2.04/textord/drawtord.h",
    "vendor/tesseract-2.04/textord/edgblob.cpp",
    "vendor/tesseract-2.04/textord/edgblob.h",
    "vendor/tesseract-2.04/textord/edgloop.cpp",
    "vendor/tesseract-2.04/textord/edgloop.h",
    "vendor/tesseract-2.04/textord/fpchop.cpp",
    "vendor/tesseract-2.04/textord/fpchop.h",
    "vendor/tesseract-2.04/textord/gap_map.cpp",
    "vendor/tesseract-2.04/textord/gap_map.h",
    "vendor/tesseract-2.04/textord/makerow.cpp",
    "vendor/tesseract-2.04/textord/makerow.h",
    "vendor/tesseract-2.04/textord/oldbasel.cpp",
    "vendor/tesseract-2.04/textord/oldbasel.h",
    "vendor/tesseract-2.04/textord/pithsync.cpp",
    "vendor/tesseract-2.04/textord/pithsync.h",
    "vendor/tesseract-2.04/textord/pitsync1.cpp",
    "vendor/tesseract-2.04/textord/pitsync1.h",
    "vendor/tesseract-2.04/textord/scanedg.cpp",
    "vendor/tesseract-2.04/textord/scanedg.h",
    "vendor/tesseract-2.04/textord/sortflts.cpp",
    "vendor/tesseract-2.04/textord/sortflts.h",
    "vendor/tesseract-2.04/textord/tessout.h",
    "vendor/tesseract-2.04/textord/topitch.cpp",
    "vendor/tesseract-2.04/textord/topitch.h",
    "vendor/tesseract-2.04/textord/tordmain.cpp",
    "vendor/tesseract-2.04/textord/tordmain.h",
    "vendor/tesseract-2.04/textord/tospace.cpp",
    "vendor/tesseract-2.04/textord/tospace.h",
    "vendor/tesseract-2.04/textord/tovars.cpp",
    "vendor/tesseract-2.04/textord/tovars.h",
    "vendor/tesseract-2.04/textord/underlin.cpp",
    "vendor/tesseract-2.04/textord/underlin.h",
    "vendor/tesseract-2.04/textord/wordseg.cpp",
    "vendor/tesseract-2.04/textord/wordseg.h",
    "vendor/tesseract-2.04/training/Makefile.am",
    "vendor/tesseract-2.04/training/Makefile.in",
    "vendor/tesseract-2.04/training/cnTraining.cpp",
    "vendor/tesseract-2.04/training/cntraining.dsp",
    "vendor/tesseract-2.04/training/cntraining.vcproj",
    "vendor/tesseract-2.04/training/mergenf.cpp",
    "vendor/tesseract-2.04/training/mergenf.h",
    "vendor/tesseract-2.04/training/mfTraining.cpp",
    "vendor/tesseract-2.04/training/mftraining.dsp",
    "vendor/tesseract-2.04/training/mftraining.vcproj",
    "vendor/tesseract-2.04/training/name2char.cpp",
    "vendor/tesseract-2.04/training/name2char.h",
    "vendor/tesseract-2.04/training/training.cpp",
    "vendor/tesseract-2.04/training/training.h",
    "vendor/tesseract-2.04/training/unicharset_extractor.cpp",
    "vendor/tesseract-2.04/training/unicharset_extractor.dsp",
    "vendor/tesseract-2.04/training/unicharset_extractor.vcproj",
    "vendor/tesseract-2.04/training/wordlist2dawg.cpp",
    "vendor/tesseract-2.04/training/wordlist2dawg.dsp",
    "vendor/tesseract-2.04/training/wordlist2dawg.vcproj",
    "vendor/tesseract-2.04/viewer/Makefile.am",
    "vendor/tesseract-2.04/viewer/Makefile.in",
    "vendor/tesseract-2.04/viewer/scrollview.cpp",
    "vendor/tesseract-2.04/viewer/scrollview.h",
    "vendor/tesseract-2.04/viewer/svmnode.cpp",
    "vendor/tesseract-2.04/viewer/svmnode.h",
    "vendor/tesseract-2.04/viewer/svpaint.cpp",
    "vendor/tesseract-2.04/viewer/svutil.cpp",
    "vendor/tesseract-2.04/viewer/svutil.h",
    "vendor/tesseract-2.04/wordrec/Makefile.am",
    "vendor/tesseract-2.04/wordrec/Makefile.in",
    "vendor/tesseract-2.04/wordrec/associate.cpp",
    "vendor/tesseract-2.04/wordrec/associate.h",
    "vendor/tesseract-2.04/wordrec/badwords.cpp",
    "vendor/tesseract-2.04/wordrec/badwords.h",
    "vendor/tesseract-2.04/wordrec/bestfirst.cpp",
    "vendor/tesseract-2.04/wordrec/bestfirst.h",
    "vendor/tesseract-2.04/wordrec/charsample.h",
    "vendor/tesseract-2.04/wordrec/chop.cpp",
    "vendor/tesseract-2.04/wordrec/chop.h",
    "vendor/tesseract-2.04/wordrec/chopper.cpp",
    "vendor/tesseract-2.04/wordrec/chopper.h",
    "vendor/tesseract-2.04/wordrec/closed.cpp",
    "vendor/tesseract-2.04/wordrec/closed.h",
    "vendor/tesseract-2.04/wordrec/djmenus.cpp",
    "vendor/tesseract-2.04/wordrec/djmenus.h",
    "vendor/tesseract-2.04/wordrec/drawfx.cpp",
    "vendor/tesseract-2.04/wordrec/drawfx.h",
    "vendor/tesseract-2.04/wordrec/findseam.cpp",
    "vendor/tesseract-2.04/wordrec/findseam.h",
    "vendor/tesseract-2.04/wordrec/gradechop.cpp",
    "vendor/tesseract-2.04/wordrec/gradechop.h",
    "vendor/tesseract-2.04/wordrec/heuristic.cpp",
    "vendor/tesseract-2.04/wordrec/heuristic.h",
    "vendor/tesseract-2.04/wordrec/makechop.cpp",
    "vendor/tesseract-2.04/wordrec/makechop.h",
    "vendor/tesseract-2.04/wordrec/matchtab.cpp",
    "vendor/tesseract-2.04/wordrec/matchtab.h",
    "vendor/tesseract-2.04/wordrec/matrix.cpp",
    "vendor/tesseract-2.04/wordrec/matrix.h",
    "vendor/tesseract-2.04/wordrec/measure.h",
    "vendor/tesseract-2.04/wordrec/metrics.cpp",
    "vendor/tesseract-2.04/wordrec/metrics.h",
    "vendor/tesseract-2.04/wordrec/mfvars.cpp",
    "vendor/tesseract-2.04/wordrec/mfvars.h",
    "vendor/tesseract-2.04/wordrec/msmenus.cpp",
    "vendor/tesseract-2.04/wordrec/msmenus.h",
    "vendor/tesseract-2.04/wordrec/olutil.cpp",
    "vendor/tesseract-2.04/wordrec/olutil.h",
    "vendor/tesseract-2.04/wordrec/outlines.cpp",
    "vendor/tesseract-2.04/wordrec/outlines.h",
    "vendor/tesseract-2.04/wordrec/pieces.cpp",
    "vendor/tesseract-2.04/wordrec/pieces.h",
    "vendor/tesseract-2.04/wordrec/plotedges.cpp",
    "vendor/tesseract-2.04/wordrec/plotedges.h",
    "vendor/tesseract-2.04/wordrec/plotseg.cpp",
    "vendor/tesseract-2.04/wordrec/plotseg.h",
    "vendor/tesseract-2.04/wordrec/render.cpp",
    "vendor/tesseract-2.04/wordrec/render.h",
    "vendor/tesseract-2.04/wordrec/seam.cpp",
    "vendor/tesseract-2.04/wordrec/seam.h",
    "vendor/tesseract-2.04/wordrec/split.cpp",
    "vendor/tesseract-2.04/wordrec/split.h",
    "vendor/tesseract-2.04/wordrec/tally.cpp",
    "vendor/tesseract-2.04/wordrec/tally.h",
    "vendor/tesseract-2.04/wordrec/tessinit.cpp",
    "vendor/tesseract-2.04/wordrec/tessinit.h",
    "vendor/tesseract-2.04/wordrec/tface.cpp",
    "vendor/tesseract-2.04/wordrec/tface.h",
    "vendor/tesseract-2.04/wordrec/wordclass.cpp",
    "vendor/tesseract-2.04/wordrec/wordclass.h"
  ]
  s.homepage = %q{http://github.com/dannnylo/tesseract_bin}
  s.licenses = [%q{MIT}]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{Gem binary of tesseract 2.04}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.3"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
  end
end

