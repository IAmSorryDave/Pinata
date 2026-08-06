#!/usr/bin/bash
pre-commit run --hook-stage manual increment-version-by-build --all-files
git add .
