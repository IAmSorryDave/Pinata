#!/usr/bin/bash
git stash --keep-index --include-untracked
pre-commit run --hook-stage manual increment-version-by-patch --all-files
git add .
git stash pop
