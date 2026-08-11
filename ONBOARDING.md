### Recommended Development Path 🚗

To take advantage of event driven versioning and security reviews, follow the recommended development path.
Be sure to create a Docker Hub Repository before merging into main. 


```
nth test set branch
    ↓ (merge new tests / fixtures)
    ↓ (increment minor) 
test development branch ← ← ← ← ← ← ← ← ← ← ← ← ← ← ← ← (merge changes) ← ← ← ← ← ← ← ← ← ← ← ← ← ← (New Development Cycle)
    ↓ (merge changes)                                                                                                 ↑
    ↓ (increment build)                                                                                               ↑
container development branch ← (push new feature) ← (write implementation with AI)                                    ↑
    ↓ (tests pass)                                                                                                    ↑
    ↓ (increment pre-release)                                                                                         ↑
security review branch                                                                                                ↑
    ↓                                                                                                                 ↑
spawns release canidate branch, the nth release candidate.                                                            ↑
    ↓ (merge changes)                                                                                                 ↑
    ↓ (increment major)                                                                                               ↑
main branch → Auto-Deploy to DockerHub → → → → → → → → → → → → → → → → → → → → → → → → → → → → → → → → → → → → → → → →  
```

### Secrets 🤫

``` DOCKER_USERNAME ``` : Your Docker Hub username.

``` DOCKER_PASSCODE ``` : Your Docker Hub passcode. It’s strongly recommended you use a Docker Hub PAT in lieu of your actual password.

### .env 🏕️

HOST="docker.io"  Change for private registry
PORT=5000 # Define Custom port.
ALTERNATE_REPO_NAME="Your Repo Name" # Define when your registry repository name differs from your GitHub user name.
