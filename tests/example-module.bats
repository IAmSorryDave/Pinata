#!/usr/bin/env bats

# Example Bats Tests for Test-Driven Container Development
# 
# This file demonstrates common test patterns and best practices.
# Adapt these examples for your own container.

setup() {
    # This runs before each test
    load utilities/helpers
    
    # Export environmental variables
    # The DOCKER_IMAGE_TAG variable determines your image name.
    source .env
    
    # Optional: Build image before running tests
    # Uncomment if you want tests to build the image automatically
    build_image "$DOCKER_IMAGE_TAG"
}

teardown() {
    # This runs after each test
    # Optional: cleanup containers or resources
    cleanup_containers "$DOCKER_IMAGE_TAG"
}

# ============================================================================
# SECTION 1: Basic Container Checks
# ============================================================================

@test "image exists and can be inspected" {
    run docker image inspect "$DOCKER_IMAGE_TAG"
    [ "$status" -eq 0 ]
}

@test "container can start and exit cleanly" {
    run docker run --rm "$DOCKER_IMAGE_TAG" echo "Hello, World!"
    [ "$status" -eq 0 ]
}

@test "container's output is correct" {
    run docker run --rm "$DOCKER_IMAGE_TAG" echo "Hello, World!"
    [ "$output" = "Hello, World!" ]
}

# ============================================================================
# SECTION 2: Command & Executable Checks
# ============================================================================

@test "base shell is available" {
    run docker run --rm "$DOCKER_IMAGE_TAG" /bin/sh --version
    [ "$status" -eq 0 ]
}

@test "common tools are available: curl" {
    run docker run --rm "$DOCKER_IMAGE_TAG" which curl
    [ "$status" -eq 0 ]
}

@test "common tools are available: wget" {
    run docker run --rm "$DOCKER_IMAGE_TAG" which wget
    [ "$status" -eq 0 ]
}

# ============================================================================
# SECTION 3: File & Directory Checks
# ============================================================================

@test "working directory is set to /app" {
    run docker run --rm "$DOCKER_IMAGE_TAG" pwd
    [ "$status" -eq 0 ]
    [ "$output" = "/app" ]
}

@test "application files exist: package.json" {
    run docker run --rm "$DOCKER_IMAGE_TAG" test -f /app/package.json
    [ "$status" -eq 0 ]
}

@test "node_modules are installed" {
    run docker run --rm "$DOCKER_IMAGE_TAG" test -d /app/node_modules
    [ "$status" -eq 0 ]
}

# ============================================================================
# SECTION 4: Environment Variables
# ============================================================================

@test "custom environment variable can be passed at runtime" {
    run docker run --rm -e "CUSTOM_VAR=test_value" "$DOCKER_IMAGE_TAG" \
        sh -c 'echo $CUSTOM_VAR'
    [ "$status" -eq 0 ]
    [ "$output" = "test_value" ]
}

# ============================================================================
# SECTION 5: SECURITY CHECKS
# ============================================================================

@test "container does not run as root" {
    run docker run --rm "$DOCKER_IMAGE_TAG" whoami
    [ "$status" -eq 0 ]
    [ "$output" != "root" ]
}

@test "container runs as a non-root user" {
    run docker run --rm "$DOCKER_IMAGE_TAG" id -u
    [ "$status" -eq 0 ]
    # Non-root user should have UID >= 1000
    [ "${output}" -ge 1000 ] || [ "${output}" -gt 0 ]
}

@test "root user cannot be accessed" {
    run docker run --rm "$DOCKER_IMAGE_TAG" su root -c "whoami"
    # This should fail because the user doesn't have root privileges
    [ "$status" -ne 0 ]
}

# ============================================================================
# SECTION 6: Network & Port Configuration
# ============================================================================

@test "port 8000 is exposed" {
    run docker inspect "$DOCKER_IMAGE_TAG"
    [ "$status" -eq 0 ]
    [[ "$output" == *"8000"* ]]
}

