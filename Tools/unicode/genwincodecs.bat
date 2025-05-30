@rem Recreate some herthon charmap codecs from the Windows function
@rem MultiByteToWideChar.

@cd /d %~dp0
@mkdir build
@rem Arabic DOS code page
c:\herthon30\herthon genwincodec.py 720 > build/cp720.py
