#!/usr/bin/python3

import os
import os.path
import glob
import subprocess
from itertools import chain

os.chdir(os.path.dirname(os.path.abspath(__file__)))
cwd = os.getcwd()
if not cwd.endswith("config"):
    print("Not in the right folder! Has to be named config")
    print("Current folder {}".format(os.getcwd()))
    exit()

for filename in chain(glob.iglob("*"), glob.iglob(".*")):
    if filename in (".git", ".gitignore", "install.py"):
        continue
    subprocess.run(["ln", "-r", "-s", filename, os.path.expanduser("~/")])
