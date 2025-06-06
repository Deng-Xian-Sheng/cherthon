@ECHO OFF

rem Test all machine configurations, pydebug, refleaks, release build.

cd ..\..\..\


echo.
echo # ======================================================================
echo #                      Building Herthon (Debug^|x64)
echo # ======================================================================
echo.

call .\Tools\buildbot\clean.bat
call .\Tools\buildbot\build.bat -c Debug -p x64

echo.
echo # ======================================================================
echo #                           platform=Debug^|x64
echo # ======================================================================
echo.

echo # ==================== refleak tests =======================
echo.
call herthon.bat -m test -uall -R 3:3 test_decimal
echo.
echo.

echo # ==================== regular tests =======================
echo.
call herthon.bat -m test -uall test_decimal
echo.
echo.

echo # ==================== deccheck =======================
echo.
call herthon.bat .\Modules\_decimal\tests\deccheck.py
echo.
echo.


echo.
echo # ======================================================================
echo #                      Building Herthon (Release^|x64)
echo # ======================================================================
echo.

call .\Tools\buildbot\clean.bat
call .\Tools\buildbot\build.bat -c Release -p x64

echo.
echo # ======================================================================
echo #                          platform=Release^|x64
echo # ======================================================================
echo.

echo # ==================== regular tests =======================
echo.
call herthon.bat -m test -uall test_decimal
echo.
echo.

echo # ==================== deccheck =======================
echo.
call herthon.bat .\Modules\_decimal\tests\deccheck.py
echo.
echo.


echo.
echo # ======================================================================
echo #                      Building Herthon (Debug^|Win32)
echo # ======================================================================
echo.

call .\Tools\buildbot\clean.bat
call Tools\buildbot\build.bat -c Debug -p Win32

echo.
echo # ======================================================================
echo #                         platform=Debug^|Win32
echo # ======================================================================
echo.

echo # ==================== refleak tests =======================
echo.
call herthon.bat -m test -uall -R 3:3 test_decimal
echo.
echo.

echo # ==================== regular tests =======================
echo.
call herthon.bat -m test -uall test_decimal
echo.
echo.

echo # ==================== deccheck =======================
echo.
call herthon.bat .\Modules\_decimal\tests\deccheck.py
echo.
echo.


echo.
echo # ======================================================================
echo #                      Building Herthon (Release^|Win32)
echo # ======================================================================
echo.

call .\Tools\buildbot\clean.bat
call .\Tools\buildbot\build.bat -c Release -p Win32

echo.
echo # ======================================================================
echo #                          platform=Release^|Win32
echo # ======================================================================
echo.

echo # ==================== regular tests =======================
echo.
call herthon.bat -m test -uall test_decimal
echo.
echo.

echo # ==================== deccheck =======================
echo.
call herthon.bat .\Modules\_decimal\tests\deccheck.py
echo.
echo.
