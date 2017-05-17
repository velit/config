#!/usr/bin/env python3

import os
from pathlib import Path


def make_folders():
    for path in Path(".").glob("folders/*"):
        if path.is_dir():
            os.makedirs(Path.home() / path.name, exist_ok=True)


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="Make folders in stow package folders in userdir.")
    args = parser.parse_args()
    make_folders()
