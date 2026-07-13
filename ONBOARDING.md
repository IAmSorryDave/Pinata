# Test-Driven Container Development: Getting Started

Welcome! This template enables you to develop Docker containers using **test-driven development (TDD)** with **Bats** (Bash Automated Testing Framework).

## What is This?

This workflow separates concerns into a **multi-branch strategy**:

- **test-development** → Write tests that define features
- **container-development** → Build the Dockerfile that passes tests
- **security-review** → Scan for vulnerabilities, propose security tests
- **main** → Production-ready, auto-deployed to Docker Hub

## Initial Setup (Do This First)

1. **Click "Use this template"** on GitHub to create your own repo

2. **Clone your new repo:**
   ```bash
   git clone https://github.com/<your-username>/<your-repo>.git
   cd <your-repo>

### Security Scanning & SARIF

When you create a PR to `main`:

1. **Trivy automatically scans** your Docker image for vulnerabilities
2. **Results upload to GitHub's code scanning** (SARIF format)
3. **View in:** Settings → Security → Code scanning alerts
4. **Address vulnerabilities** before merging to `main`

GitHub will block merges if critical vulnerabilities exist (if branch protection is enforced).

1. Enable Code Scanning

Code scanning automatically processes security vulnerability reports from Trivy.

Go to Settings → Code security and analysis
 - Enable Code scanning (GitHub offers this at no extra cost)
 - Confirm Dependency graph is enabled
 - Status: You'll see "Code scanning alerts" section appear

2. Configure GitHub Actions Permissions

Your workflows need permission to write security events to GitHub.

- Go to Settings → Actions → General
- Under Workflow permissions, select:
   ✅ Read and write permissions (allows workflows to write security events)
   ✅ Allow GitHub Actions to create and approve pull requests
- Save
  
3. Set Up Branch Protection Rules

Enforce automated testing and security checks before merging.

For security-review branch:

- Go to Settings → Branches
- Click Add rule
- Set Branch name pattern to: security-review
  Enable:
     ✅ Require status checks to pass before merging
     ✅ Require branches to be up to date before merging
     Under Status checks that are required, add: security-scan (Trivy vulnerability scan)
- Save
