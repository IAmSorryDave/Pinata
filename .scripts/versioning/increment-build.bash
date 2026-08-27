#!/usr/bin/bash

if [ -f VERSION ]; then
	git update-index --assume-unchanged VERSION
	pre-commit run --hook-stage manual increment-version-by-build --all-files
	git update-index --no-assume-unchanged VERSION
else
	pre-commit run --hook-stage manual increment-version-by-build --all-files
fi

git add VERSION
