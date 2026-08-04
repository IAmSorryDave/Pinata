#!/usr/bin/bash
git stash --keep-index --include-untracked
pre-commit run --hook-stage manual increment-version-by-major --all-files
git add .
git stash pop
