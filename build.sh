#!/bin/sh
# Builds dist/QcloudVolte-Module.zip (Magisk/KernelSU) and dist/QcloudVolte-Scripts.zip (root + adb installers)
# Put your two modified files in release-files/ first:
#   release-files/Ims6.apk          (the patched apk, built from smali/ and signed)
#   release-files/libims.lge.so     (the patched library, see native/patch_libims.sh)
set -e
cd "$(dirname "$0")"
APK=release-files/Ims6.apk; LIB=release-files/libims.lge.so
[ -s "$APK" ] || { echo "missing $APK"; exit 1; }
[ -s "$LIB" ] || { echo "missing $LIB"; exit 1; }
LIBMD5=$(md5sum "$LIB" | cut -d' ' -f1)
[ "$LIBMD5" = "6cc81e7aaffafe13fcebf0a10171f20f" ] || echo "WARNING: libims md5 is $LIBMD5, expected 6cc81e7aaffafe13fcebf0a10171f20f"
rm -rf build dist; mkdir -p build/module build/scripts dist
# module
cp -r module/. build/module/
rm -f build/module/system/system_ext/priv-app/Ims6/PUT_*.txt build/module/system/system_ext/lib64/PUT_*.txt
cp "$APK" build/module/system/system_ext/priv-app/Ims6/Ims6.apk
cp "$LIB" build/module/system/system_ext/lib64/libims.lge.so
mkdir -p build/module/scripts && cp scripts/* build/module/scripts/
(cd build/module && zip -qr9 ../../dist/QcloudVolte-Module.zip .)
# scripts package
cp scripts/* build/scripts/ && cp "$APK" "$LIB" build/scripts/
(cd build/scripts && zip -qr9 ../../dist/QcloudVolte-Scripts.zip .)
rm -rf build
(cd dist && md5sum *.zip > MD5SUMS.txt && cat MD5SUMS.txt)
echo "built in $(pwd)/dist"
