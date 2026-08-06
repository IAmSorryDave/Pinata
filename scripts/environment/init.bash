#!/bin/bash

# Source the .env file
source .env

# Check if PORT or ALTERNATE_REPO_NAME is defined
if [[ -n "$PORT" || -n "$ALTERNATE_REPO_NAME" ]]; then
    echo "PORT or ALTERNATE_REPO_NAME is defined. Running format.bash..."
    source scripts/environment/format.bash
else
    echo "Neither PORT nor ALTERNATE_REPO_NAME is defined. Skipping format.bash."
fi
