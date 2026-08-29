# Semantic Versioning (SEMVER)

This document defines the versioning scheme for your Piñata project.

## Overview

Piñata follows **Semantic Versioning 2.0.0** as defined at [semver.org](https://semver.org/). Version numbers will follow the format:


**Example:** `1.2.3`, `1.0.0-alpha.1`, `2.1.0-rc.1+build.123`

## Version Components

### MAJOR Version
Incremented when:
- **Removal or major refactoring** to Dockerfile

**Example:** `1.0.0` → `2.0.0`

### MINOR Version
Incremented when:
- **New features** added in a backward-compatible manner
- New testing modules are introduced that add new features without breaking backwards compatibility.

**Example:** `1.2.0` → `1.3.0`

### PATCH Version
Incremented when:
- **Bug fixes** to existing feature tests 
- Security patches or vulnerability fixes
- Documentation corrections (not including feature documentation)
- Performance improvements with no API changes
- Dependency updates that maintain backward compatibility

**Example:** `1.2.1` → `1.2.2`

## Pre-Release Versions

Pre-release versions indicate development versions and take precedence is lower than the associated release version. Format: `MAJOR.MINOR.PATCH-IDENTIFIER`

**Supported identifiers:**
- `build` – Feature-implementation-complete
- `rc` (release candidate) – Stable, awaiting final release

**Examples:**
- `1.0.0+build.2` – Second agentic build.
- `1.0.0rc.1` – First release candidate

Pre-release versions can be chained: `1.0.0-alpha.1 < 1.0.0-alpha.2 < 1.0.0-beta.1 < 1.0.0-rc.1 < 1.0.0`

