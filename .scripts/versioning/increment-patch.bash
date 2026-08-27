#!/usr/bin/bash

if [ -f VERSION ]; then
	git update-index --assume-unchanged VERSION
	pre-commit run --hook-stage manual increment-version-by-patch --all-files
	git update-index --no-assume-unchanged VERSION
else
	pre-commit run --hook-stage manual increment-version-by-patch --all-files
fi

git add VERSION
