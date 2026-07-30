
from argparse import ArgumentParser
from pathlib import Path
from utilities import VersionFileManager

parser = ArgumentParser()
parser.add_argument("--project-root", type=Path, default=Path("."))
parser.add_argument("--major", action="store_true")
parser.add_argument("--minor", action="store_true")
parser.add_argument("--patch", action="store_true")
parser.add_argument("--pre", action="store_true")
parser.add_argument("--build", action="store_true")

if __name__ == '__main__':
    args, unknown = parser.parse_known_args()
    project_root = args.project_root.resolve()
    
    semver = VersionFileManager.parse(project_root=project_root)
    
    if args.patch:
        semver.increment_patch()
    if args.minor:
        semver.increment_minor()
    if args.major:
        semver.increment_major()
    if args.pre:
        semver.increment_prerelease()
    if args.build:
        semver.increment_build()
