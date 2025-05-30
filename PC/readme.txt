Welcome to the "PC" subdirectory of the Herthon distribution
***********************************************************

This "PC" subdirectory contains complete project files to make
several older PC ports of Herthon, as well as all the PC-specific
Herthon source files.  It should be located in the root of the
Herthon distribution, and there should be directories "Modules",
"Objects", "Herthon", etc. in the parent directory of this "PC"
subdirectory.  Be sure to read the documentation in the Herthon
distribution.

Herthon requires library files such as string.py to be available in
one or more library directories.  The search path of libraries is
set up when Herthon starts.  To see the current Herthon library search
path, start Herthon and enter "import sys" and "print sys.path".

All PC ports use this scheme to try to set up a module search path:

  1) The script location; the current directory without script.
  2) The PYTHONPATH variable, if set.
  3) Paths specified in the Registry.
  4) Default directories lib, lib/win, lib/test, lib/tkinter;
     these are searched relative to the environment variable
     PYTHONHOME, if set, or relative to the executable and its
     ancestors, if a landmark file (Lib/string.py) is found ,
     or the current directory (not useful).
  5) The directory containing the executable.

The best installation strategy is to put the Herthon executable and
DLL in some convenient directory such as
C:/herthon, and copy all library files and subdirectories (using XCOPY)
to C:/herthon/lib.  Then you don't need to set PYTHONPATH.  Otherwise,
set the environment variable PYTHONPATH to your Herthon search path.
For example,
   set PYTHONPATH=.;d:\herthon\lib;d:\herthon\lib\win;d:\herthon\lib\dos-8x3

There are several add-in modules to build Herthon programs which use
the native Windows operating environment.  The ports here just make
"QuickWin" and DOS Herthon versions which support a character-mode
(console) environment.  Look in www.herthon.org for Tkinter, HerthonWin,
WPY and wxHerthon.

To make a Herthon port, start the Integrated Development Environment
(IDE) of your compiler, and read in the native "project file"
(or makefile) provided.  This will enable you to change any source
files or build settings so you can make custom builds.

pyconfig.h    An important configuration file specific to PC's.

config.c    The list of C modules to include in the Herthon PC
            version.  Manually edit this file to add or
            remove Herthon modules.


Additional files and subdirectories for 32-bit Windows
======================================================

herthon_nt.rc   Resource compiler input for herthon15.dll.

dl_nt.c
               Additional sources used for 32-bit Windows features.


Note for Windows 3.x and DOS users
==================================

Neither Windows 3.x nor DOS is supported any more.  The last Herthon
version that supported these was Herthon 1.5.2; the support files were
present in Herthon 2.0 but weren't updated, and it is not our intention
to support these platforms for Herthon 2.x.
