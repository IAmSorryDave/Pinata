#!/usr/bin/bash
INITIAL_VERSION=$(basename $(git remote get-url origin))
touch VERSION
echo $INITIAL_VERSION | tr '[:upper:]' '[:lower:]' >> VERSION
