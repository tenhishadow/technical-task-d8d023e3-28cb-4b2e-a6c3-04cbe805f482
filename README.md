# FastAPI Kubernetes Interview Task Implementation

[Implementation Pull Request ](https://github.com/tenhishadow/technical-task-d8d023e3-28cb-4b2e-a6c3-04cbe805f482/pull/1 )

## CI/CD Pipeline Documentation

### Workflow Overview

- **Triggers**:
  - On push to `main` or `dev`, except docs and metadata files.
  - On pull request to `main`, ignoring the same paths.
- **Jobs**:
  - `test`: Runs tests in a clean Python environment using `pipenv`.
  - `build`: Builds and pushes a Docker image to GitHub Container Registry (GHCR).
  - `deploy`: Updates Kubernetes manifests with the new image tag.
- **ArgoCD Integration**:
  - ArgoCD is configured separately and continuously monitors the repository.
  - After the deployment job updates the manifest, ArgoCD detects the change and applies it to the cluster.

```mermaid
graph TD
    A[Push or PR to GitHub] --> B[Test Job]
    B -->|Tests pass| C[Build Job]
    C --> D[Push Image to GHCR]
    D --> E[Deploy Job]
    E --> F[Update Kubernetes Manifest]
    F --> G[ArgoCD Watches Repo]
    G --> H[ArgoCD Syncs Deployment]
```

### Key Features

* Python Environment: Uses Python 3.13 with dependency caching and pipenv( all versioned and auto-updated with dependabot )

* Containerization: Docker images built with Buildx and pushed to GHCR.

* Immutable Tags: Each image is tagged with the Git commit SHA.

* Manifest Management: Kubernetes YAML updated in-place using yq. ( for simplicity + escape build with ci skip tag )

* GitOps Friendly: Deployment relies on ArgoCD watching the repository state.

### Pipenv: Quick Guide

```bash
pip install pipenv
```

Initialize a Project

```bash
pipenv install            # Creates a virtual environment and Pipfile
pipenv install <package>  # Install a package
pipenv install <package> --dev  # Install a dev dependency
```

Regular vs Dev Packages

* Regular packages ([packages]): Required to run the application.
* Dev packages ([dev-packages]): Needed only during development (e.g., testing, linting).

## Local development

```bash
pipenv run test # run tests
pipenv run serve # serve locally
```

### .env for local development example

Example (this file is ignored by git)

```bash
# file .env
ENV="local"
LOG_LEVEL="debug"
DATABASE_URL="sqlite://memory"
TIMEOUT_SECONDS="0"
```

## Local development with Docker

```bash
docker-compose up --build
```

