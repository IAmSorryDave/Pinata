#!/bin/bash

# Source your .env file
set -a
source .env
set +a

# Option 1: Get PROJECT_NAME from git repository root directory name
PROJECT_NAME=$(basename "$(git remote get-url origin)")

# Determine DOCKER_IMAGE_TAG based on conditions
if [[ -n "$ALTERNATE_REPO_NAME" ]] && [[ -n "$PORT" ]]; then
    DOCKER_IMAGE_TAG="${HOST}:${PORT}/${ALTERNATE_REPO_NAME,,}${PROJECT_NAME,,}:$(cat VERSION)"
elif [[ -n "$ALTERNATE_REPO_NAME" ]]; then
    DOCKER_IMAGE_TAG="${HOST}/${ALTERNATE_REPO_NAME,,}${PROJECT_NAME,,}:$(cat VERSION)"
elif [[ -n "$PORT" ]]; then
    DOCKER_IMAGE_TAG="${HOST}:${PORT}/${GITHUB_REPOSITORY,,}:$(cat VERSION)"
else
    DOCKER_IMAGE_TAG="${HOST}/${GITHUB_REPOSITORY,,}:$(cat VERSION)"
fi
