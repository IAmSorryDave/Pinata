# 🫏 Piñata

**Test Driven Container Development**

Piñata is a template and toolkit for developing Docker containers using Test-Driven Development (TDD) principles. Write your tests first, then build containers that satisfy those tests—all in Bash using the BATS testing framework.

## 🎯 What is Piñata?

Piñata makes it easy to practice TDD with Docker containers. Instead of manually testing your images after building them, you define expected behavior upfront through automated tests, then develop your Dockerfiles incrementally to pass those tests.

## Pre-Configured for CoPilot 💬 

``` .github/prompts/implement-features.promt.md ``` 

Already contains instructions for CoPilot to implement your Dockerfile.

## 🧪 Testing…

Define your tests at ```bats/tests ``` .
Once you have done, you can kick off CoPilot
Additional tooling can be found at ```bats/utilities ```

### Key Features

- 🧪 **BATS Testing Framework** – Simple, bash-native testing for containers
- 🐳 **Docker-First Development** – Build and test containers with confidence
- 🔒 **Security Scanning** – Integrated Trivy vulnerability scanning
- 🪝 **Git Hooks** – Automated quality checks before commits
- 📦 **Dev Containers** – Instant development environment setup
- 🔄 **CI/CD Ready** – GitHub Actions workflows included

## 🚀 Quick Start

### Prerequisites

- **Docker** (v20.10+)
- **Docker Compose** (optional, for multi-container setups)
- **Bash** (v4.0+)
- **BATS** (included)
   
