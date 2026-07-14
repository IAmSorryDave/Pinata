#!/usr/bin/bash
INITIAL_VERSION="$(basename $(git remote get-url origin)):0.0.0"
echo $INITIAL_VERSION | tr '[:upper:]' '[:lower:]' >> VERSION