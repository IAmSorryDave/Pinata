#!/usr/bin/bash
git stash --keep-index --include-untracked
pre-commit run --hook-stage manual increment-version-by-prerelease --all-files
git add .
git stash pop
