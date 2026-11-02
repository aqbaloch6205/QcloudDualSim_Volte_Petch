#!/usr/bin/env python3
"""Builds the release zips with Python 3 only (no zip command needed).

Put your two modified files exactly here:
  release-files/system_ext/lib64/libims.lge.so
  release-files/system_ext/priv-app/Ims6/Ims6.apk

Output in dist/:
  QcloudVolte-Scripts.zip           scripts only, no LG files (always built)
  QcloudVolte-Module.zip            Magisk/KernelSU module (built when your files exist)
  QcloudVolte-System-Installer.zip  files in system/ layout + install scripts, copies them
                                    into /system_ext without Magisk (built when your files exist)
"""
import hashlib, os, shutil, zipfile

ROOT = os.path.dirname(os.path.abspath(__file__))
os.chdir(ROOT)

APK_SRC = "release-files/system_ext/priv-app/Ims6/Ims6.apk"
LIB_SRC = "release-files/system_ext/lib64/libims.lge.so"
APK_DST = "system/system_ext/priv-app/Ims6/Ims6.apk"
LIB_DST = "system/system_ext/lib64/libims.lge.so"
LIB_MD5 = "6cc81e7aaffafe13fcebf0a10171f20f"


def skip(name):
    return name.startswith("PUT_") or name.startswith(".")


def add_tree(z, src, arc_root=""):
    for dp, dns, fns in os.walk(src):
        dns[:] = [d for d in dns if not d.startswith(".")]
        for fn in fns:
            if skip(fn):
                continue
            full = os.path.join(dp, fn)
            arc = os.path.join(arc_root, os.path.relpath(full, src)).replace(os.sep, "/")
            z.write(full, arc)


def has(path):
    return os.path.isfile(path) and os.path.getsize(path) > 0


shutil.rmtree("dist", ignore_errors=True)
os.makedirs("dist")
built = []

# 1. scripts zip (no LG files)
with zipfile.ZipFile("dist/QcloudVolte-Scripts.zip", "w", zipfile.ZIP_DEFLATED) as z:
    add_tree(z, "scripts", "scripts")
built.append("QcloudVolte-Scripts.zip")

have_files = has(APK_SRC) and has(LIB_SRC)
if have_files:
    md5 = hashlib.md5(open(LIB_SRC, "rb").read()).hexdigest()
    if md5 != LIB_MD5:
        print(f"WARNING: libims md5 is {md5}, expected {LIB_MD5}")

    # 2. Magisk / KernelSU module
    with zipfile.ZipFile("dist/QcloudVolte-Module.zip", "w", zipfile.ZIP_DEFLATED) as z:
        add_tree(z, "module")
        z.write(APK_SRC, APK_DST)
        z.write(LIB_SRC, LIB_DST)
        add_tree(z, "scripts", "scripts")
    built.append("QcloudVolte-Module.zip")

    # 3. system installer (no Magisk): flat system/ layout + scripts at the root
    with zipfile.ZipFile("dist/QcloudVolte-System-Installer.zip", "w", zipfile.ZIP_DEFLATED) as z:
        z.write(APK_SRC, APK_DST)
        z.write(LIB_SRC, LIB_DST)
        for fn in sorted(os.listdir("scripts")):
            if os.path.isfile(os.path.join("scripts", fn)) and not skip(fn):
                z.write(os.path.join("scripts", fn), fn)
    built.append("QcloudVolte-System-Installer.zip")
else:
    print(f"Module and system installer skipped: {APK_SRC} or {LIB_SRC} is missing.")

with open("dist/MD5SUMS.txt", "w") as f:
    for name in built:
        h = hashlib.md5(open(os.path.join("dist", name), "rb").read()).hexdigest()
        f.write(f"{h}  {name}\n")
print(open("dist/MD5SUMS.txt").read())
print(f"built in {os.path.join(ROOT, 'dist')}")
