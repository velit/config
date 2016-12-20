#!/usr/bin/python3

import os
import os.path
import sys
import glob
import subprocess
from itertools import chain


def install(force=False):
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
    cwd = os.getcwd()
    if not cwd.endswith("config"):
        print("Not in the right folder! Has to be named config", file=sys.stderr)
        print("Current folder {}".format(os.getcwd()), file=sys.stderr)
        exit(1)

    for filename in chain(glob.iglob("*"), glob.iglob(".*")):
        if filename in (".git", ".gitignore", "install.py"):
            continue
        if force:
            subprocess.run(["ln", "-f", "-r", "-s", filename, os.path.expanduser("~/")])
        else:
            subprocess.run(["ln", "-r", "-s", filename, os.path.expanduser("~/")])


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="Symlink the all the configuration files in this config directory into user root directory.")
    parser.add_argument("-f", "--force", action="store_true", help="Overwrite existing files when making links.")
    args = parser.parse_args()
    install(args.force)
