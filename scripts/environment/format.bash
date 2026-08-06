#!/bin/bash

# Source your .env file
set -a
source .env
set +a

# Option 1: Get PROJECT_NAME from git repository root directory name
PROJECT_NAME=$(basename "$(git remote get-url origin)")

# Option 2: Extract repository name from git remote origin URL
# PROJECT_NAME=$(git remote get-url origin | xargs basename -s .git)

# Option 3: Extract just the repo name from origin URL (handles .git suffix)
# PROJECT_NAME=$(git config --get remote.origin.url | sed 's/.*\///' | sed 's/\.git$//')

# Determine DOCKER_IMAGE_TAG based on conditions
if [[ -n "$ALTERNATE_REPO_NAME" ]] && [[ -n "$PORT" ]]; then
    DOCKER_IMAGE_TAG="${HOST}:${PORT}/${ALTERNATE_REPO_NAME,,}${PROJECT_NAME,,}:$(cat VERSION)"
elif [[ -n "$ALTERNATE_REPO_NAME" ]]; then
    DOCKER_IMAGE_TAG="${HOST}${PORT}/${ALTERNATE_REPO_NAME,,}${PROJECT_NAME,,}:$(cat VERSION)"
elif [[ -n "$PORT" ]]; then
    DOCKER_IMAGE_TAG="${HOST}:${PORT}/${GITHUB_REPOSITORY,,}:$(cat VERSION)"
else
    DOCKER_IMAGE_TAG="${HOST}${PORT}/${GITHUB_REPOSITORY,,}:$(cat VERSION)"
fi

export DOCKER_IMAGE_TAG
