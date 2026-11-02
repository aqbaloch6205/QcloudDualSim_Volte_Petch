#!/usr/bin/env python3
"""One-command release, run on the machine that has release-files/ (your patched files).

  python3 release.py v1.0

1. Runs build.py: builds dist/QcloudVolte-Scripts.zip and, because release-files/ is present,
   dist/QcloudVolte-Module.zip (the module is built from your own files, nothing is committed).
2. Creates the GitHub release v1.0 with those zips and MD5SUMS.txt (or uploads to it if it exists).

Needs the GitHub CLI: `gh auth login` once. On Termux: `pkg install gh python`.
"""
import os
import shutil
import subprocess
import sys

ROOT = os.path.dirname(os.path.abspath(__file__))
os.chdir(ROOT)

if len(sys.argv) != 2:
    sys.exit("usage: python3 release.py v1.0")
TAG = sys.argv[1]

if shutil.which("gh") is None:
    sys.exit("gh CLI not found. Install it (Termux: pkg install gh) and run: gh auth login")

subprocess.run([sys.executable, "build.py"], check=True)

assets = sorted(os.path.join("dist", f) for f in os.listdir("dist"))
if not any(a.endswith("QcloudVolte-Module.zip") for a in assets):
    print("NOTE: module zip not built (release-files/ is missing Ims6.apk or libims.lge.so). Releasing scripts only.")

exists = subprocess.run(["gh", "release", "view", TAG], capture_output=True).returncode == 0
if exists:
    subprocess.run(["gh", "release", "upload", TAG, *assets, "--clobber"], check=True)
    print(f"uploaded to existing release {TAG}")
else:
    subprocess.run(["gh", "release", "create", TAG, *assets,
                    "--target", "main",
                    "--title", f"QcloudVolte {TAG}",
                    "--notes-file", "RELEASE_NOTES.md"], check=True)
    print(f"release {TAG} created")
for a in assets:
    print("  " + a)
