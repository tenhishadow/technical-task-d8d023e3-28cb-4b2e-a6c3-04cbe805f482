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

