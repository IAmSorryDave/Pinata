#!/usr/bin/bash
pre-commit run --hook-stage manual increment-version-by-major --all-files
git add .
