#!/usr/bin/env python3

PYBINARY = "python3.6"

import os
import sys
import subprocess
from pathlib import Path


def make_folders():
    for path in Path(".").glob("folders/*"):
        if path.is_dir():
            os.makedirs(Path.home() / path.name, exist_ok=True)


local_gitconfig_content = (
"""[user]
    name = Tapani Kiiskinen
    email = """
)


def write_local_settings():

    local_gitconfig = Path.home() / Path(".gitconfig_local")
    if not local_gitconfig.exists():
        email = input("Input email for git identity: ")
        with local_gitconfig.open('w') as f:
            f.write(f"{local_gitconfig_content}{email}\n")

    local_zsh_config = Path.home() / Path(".zsh_local")
    if not local_zsh_config.exists():
        with local_zsh_config.open('w') as f:
            f.write("")

def check_stow_existence():
    if subprocess.run(["which", "stow"]).returncode != 0:
        print("This script needs stow program to be installed", file=sys.stderr)
        sys.exit(1)



def stow(packages):
    if not packages:
        packages = [path.name for path in Path(".").glob("*/") if path.is_dir() and path.name[0] != '.']

    home_path = str(Path.home())
    subprocess.run(["stow", f"--target={home_path}"] + packages, stdout=subprocess.PIPE)


def install_python_packages():
    """Packages are documented in the python_packages.txt file."""
    subprocess.run([PYBINARY, "-m", "pip", "install", "--user", "-r", "python_packages.txt"], stdout=subprocess.PIPE)


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="Make folders in userdir, write local settings"
                                     " and stow given packages, stow all packages if none are given.")
    parser.add_argument('packages', nargs='*')
    args = parser.parse_args()
    check_stow_existence()
    make_folders()
    write_local_settings()
    stow(args.packages)
    install_python_packages()
