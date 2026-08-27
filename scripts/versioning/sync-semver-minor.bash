#!/usr/bin/bash

if [ -f VERSION ]; then
	git update-index --assume-unchanged VERSION
	pre-commit run --hook-stage manual reset-semver-minor --all-files
	for i in $(seq $(find ./bats/tests -maxdepth 1 -mindepth 1 -type f | wc -l)); do
		pre-commit run --hook-stage manual increment-version-by-minor --all-files
	done
	git update-index --no-assume-unchanged VERSION
else
	for i in $(seq $(find ./bats/tests -maxdepth 1 -mindepth 1 -type f | wc -l)); do
		pre-commit run --hook-stage manual increment-version-by-minor --all-files
	done
fi

git add VERSION
