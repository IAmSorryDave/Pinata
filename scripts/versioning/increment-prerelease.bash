#!/usr/bin/bash
pre-commit run --hook-stage manual increment-version-by-prerelease --all-files
git add .
