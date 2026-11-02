@echo off
rem QcloudVolte: install from a Windows PC over adb. Needs USB debugging and a rooted phone (su).
rem Put Ims6.apk and libims.lge.so in the same folder as this file.
cd /d "%~dp0"
where adb >nul 2>nul || (echo adb not found. Install Android platform-tools and add it to PATH. & pause & exit /b 1)
for %%F in (Ims6.apk libims.lge.so install_root.sh) do if not exist "%%F" (echo missing %%F next to this file & pause & exit /b 1)
adb get-state >nul 2>nul || (echo No phone found. Enable USB debugging and allow this PC. & pause & exit /b 1)
adb shell "rm -rf /data/local/tmp/qv; mkdir -p /data/local/tmp/qv"
adb push Ims6.apk /data/local/tmp/qv/
adb push libims.lge.so /data/local/tmp/qv/
adb push install_root.sh /data/local/tmp/qv/
if exist restore_root.sh adb push restore_root.sh /data/local/tmp/qv/
adb shell "su -c 'sh /data/local/tmp/qv/install_root.sh'"
echo.
echo If you saw an error about su, use the Magisk/KernelSU module instead.
pause
