---
name: security-warning
description: Use this prompt when weighing security considerations.
---

<!-- Tip: Use /create-prompt in chat to generate content with agent assistance -->

The ```trivy.yml``` configuration defines what vulnerabilities the user will scan for before deploying the image to a registry.
Where possible, avoid these kinds of vulnerabilities when implementing the Dockerfile.
If a test defined feature creates a vulneratbilty by default, altert the user and recomend a solution.
