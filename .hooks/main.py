
from argparse import ArgumentParser
from pathlib import Path
from utilities.version_file_manager import load_version, write_version_file

parser = ArgumentParser()
parser.add_argument("--project-root", type=Path, default=Path("."))
parser.add_argument("--major", action="store_true")
parser.add_argument("--minor", action="store_true")
parser.add_argument("--patch", action="store_true")
parser.add_argument("--pre", action="store_true")
parser.add_argument("--build", action="store_true")
parser.add_argiment("--reset_minor", action="store_true")

if __name__ == '__main__':
    args, unknown = parser.parse_known_args()
    project_root = args.project_root.resolve()
    
    version = load_version(project_root)

    if args.reset_minor:
        version = version.replace(minor=0)
    
    if args.major:
        version = version.bump_major()
    if args.minor:
        version = version.bump_minor()
    if args.patch:
        version = version.bump_patch()
    if args.pre:
        version = version.bump_prerelease()
    if args.build:
        version = version.bump_build()
    
    write_version_file(str(version), project_root)
