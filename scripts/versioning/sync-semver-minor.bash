#!/usr/bin/bash

if [ -f VERSION ]; then
	git update-index --assume-unchanged VERSION
	pre-commit run --hook-stage manual reset-semver-minor --all-files
	for i in $(seq $(find ./bats/tests -maxdepth 1 -mindepth 1 -type d | wc -l)); do
		pre-commit run --hook-stage manual increment-version-by-minor --all-files
	done
	git update-index --no-assume-unchanged VERSION
else
	pre-commit run --hook-stage manual increment-version-by-minor --all-files
fi

git add VERSION
