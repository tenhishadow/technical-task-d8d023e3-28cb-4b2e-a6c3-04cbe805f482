# FastAPI Kubernetes Interview Task

This repository contains a small FastAPI application intended for a technical interview task.

## Technical Task

Imagine this is a production application that needs to be deployed to a Kubernetes cluster.

Your task is to:

- Fork this repository.
- Understand the application code.
- Create a **Dockerfile** to containerise the application.
- Write a **Kubernetes Deployment YAML** file that deploys the application correctly.
- **Implement automated testing** using a CI tool of your choice (e.g., GitHub Actions, GitLab CI, Jenkins), running the tests in the provided `tests.py` script.
- **Build and deploy** the application locally using your preferred Kubernetes environment (e.g., Minikube, Kind).

---

## Resource Requirements

Please assume the following **resource needs** for the container:

| Resource | Recommended Value |
|:---------|:-------------------|
| CPU Request | `100m` |
| CPU Limit | `250m` |
| Memory Request | `128Mi` |
| Memory Limit | `512Mi` |

You are expected to define these in your Deployment YAML.

## Package management

[Pipenv: Python Development Workflow for Humans](https://pipenv.pypa.io/en/latest/)

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
