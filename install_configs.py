#!/usr/bin/env python3

import os
import sys
import subprocess
from pathlib import Path

def make_folders():
    for path in Path(".").glob("folders/*"):
        if path.is_dir():
            os.makedirs(Path.home() / path.name, exist_ok=True)

def write_local_settings():
    local_gitconfig = Path.home() / Path(".gitconfig_local")
    if not local_gitconfig.exists():
        with local_gitconfig.open('a') as f:
            pass

    local_gitconfig_work = Path.home() / Path(".gitconfig_work")
    if not local_gitconfig_work.exists():
        with local_gitconfig_work.open('a') as f:
            pass

    local_zsh_config = Path.home() / Path(".zsh_local")
    if not local_zsh_config.exists():
        with local_zsh_config.open('a') as f:
            pass

def check_stow_existence():
    try:
        subprocess.run(["stow", "-h"], stdout=subprocess.PIPE)
    except FileNotFoundError:
        print("This script needs stow program to be installed", file=sys.stderr)
        sys.exit(1)


def stow(packages):
    if not packages:
        packages = [path.name for path in Path(".").glob("*/") if path.is_dir() and path.name[0] != '.']

    home_path = str(Path.home())
    subprocess.run(["stow", f"--target={home_path}"] + packages, stdout=subprocess.PIPE)

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="Make folders in userdir, write local settings"
                                     " and stow given packages, stow all packages if none are given.")
    parser.add_argument('packages', nargs='*')
    args = parser.parse_args()
    check_stow_existence()
    make_folders()
    stow(args.packages)
    write_local_settings()
    print("Done setting up config files.")
