

# from argparse import ArgumentParser



# import os
# from typing import Union
from pathlib import Path

# parser, semver = ArgumentParser(), Version()

# parser.add_argument("--major", action="store_true", help="Increment Semver by Major.")

# parser.add_argument("--minor", action="store_true", help="Increment Semver by Minor.")

# parser.add_argument("--patch", action="store_true", help="Increment Semver by Patch.")

if __name__ == '__main__':

    # args = parser.parse_args()

    # if args.patch:

    #     semver.bump_patch()

    # if args.minor:

    #     semver.bump_minor()

    # if args.major:

    #     semver.bump_major()

    file_exists = version_file_exists_in_project_root()
    print(file_exists)
