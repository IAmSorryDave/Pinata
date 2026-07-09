#!/usr/bin/env bats

setup() {
    IMAGE_NAME="my-app:test"
    docker build -t "$IMAGE_NAME" .
}

teardown() {
    docker rmi -f "$IMAGE_NAME" 2>/dev/null || true
}
