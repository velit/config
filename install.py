#!/usr/bin/env python3

import os
import os.path
import sys
import glob
import subprocess
from itertools import chain


ignore_files = (
    (".git", ".gitignore", "install.py", ".ropeproject")
)


def install(force=False):
    config_dir = os.path.dirname(os.path.abspath(__file__))
    home = os.path.expanduser("~/")
    if not config_dir.endswith("config"):
        print("Not in the right folder! Has to be named config", file=sys.stderr)
        print("Current folder {}".format(config_dir), file=sys.stderr)
        exit(1)

    os.chdir(home)
    for filename in chain(glob.iglob("{}/*".format(config_dir)), glob.iglob("{}/.*".format(config_dir))):
        if any(filename.endswith(ignore_file) for ignore_file in ignore_files):
            continue
        if force:
            subprocess.run(["ln", "-f", "-s", filename])
        else:
            subprocess.run(["ln", "-s", filename])


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="Symlink the all the configuration files in this config directory into user root directory.")
    parser.add_argument("-f", "--force", action="store_true", help="Overwrite existing files when making links.")
    args = parser.parse_args()
    install(args.force)
