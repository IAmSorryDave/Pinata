

# from argparse import ArgumentParser
# from semver import Version


# import os
# from typing import Union
from semver.version import Version
from pathlib import Path



def version_file_exists_in_project_root(version_filename: str = 'VERSION') -> bool:
    abs_path = Path(version_filename).resolve()
    return abs_path.exists()






def get_version(path: Union[str, os.PathLike]) -> semver.Version:
    """
    Construct a Version object from a file

    :param path: A text file only containing the semantic version
    :return: A :class:`Version` object containing the semantic
             version from the file.
    """
    version = open(path,"r").read().strip()
    return Version.parse(version)


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
