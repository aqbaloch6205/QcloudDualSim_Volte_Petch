#!/bin/sh
# QcloudVolte: install from a PC over adb (Linux / macOS). Needs USB debugging and a rooted phone (su).
# Put Ims6.apk and libims.lge.so in the same folder as this script.
D=$(cd "$(dirname "$0")" && pwd)
command -v adb >/dev/null 2>&1 || { echo "adb not found. Install Android platform-tools."; exit 1; }
[ "$(adb get-state 2>/dev/null)" = "device" ] || { echo "No phone found. Enable USB debugging and allow this PC."; exit 1; }
for f in Ims6.apk libims.lge.so install_root.sh; do [ -s "$D/$f" ] || { echo "missing $f next to this script"; exit 1; }; done
T=/data/local/tmp/qv
adb shell "rm -rf $T; mkdir -p $T" || exit 1
for f in Ims6.apk libims.lge.so install_root.sh restore_root.sh; do [ -f "$D/$f" ] && adb push "$D/$f" $T/ >/dev/null || true; done
if adb shell "su -c id" 2>/dev/null | grep -q "uid=0"; then
  adb shell "su -c 'sh $T/install_root.sh'"
elif adb root >/dev/null 2>&1 && adb shell id | grep -q "uid=0"; then
  adb shell "sh $T/install_root.sh"
else
  echo "No root access via adb (su not available). Use the Magisk/KernelSU module instead."; exit 1
fi
