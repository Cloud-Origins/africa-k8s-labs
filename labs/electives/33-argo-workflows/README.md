# Workflows (Argo Workflows)

Track: Elective (optional)  |  Estimated time: 2.5h  |  Primary tool: Argo Workflows  |  Category: CI/CD / Batch  |  Type: Lab

Grading: manual. This elective installs and drives real ecosystem tooling; your mentor reviews your show-off checkpoint. Some tools are heavy or need a cloud account, so they are optional and run at your own pace.

## Objective

Run DAG and step-based workflows on Kubernetes.

## Your task

Install Argo Workflows, submit a multi-step Workflow, and watch it execute to completion in the UI or CLI.

## Starting point (premade)

Install the tool, then build your task on top of it:

```bash
kubectl create namespace argo && kubectl apply -n argo -f https://github.com/argoproj/argo-workflows/releases/latest/download/quick-start-minimal.yaml
```

Follow the official quickstart for current versions and full steps: https://argo-workflows.readthedocs.io/en/latest/quick-start/

## Show-off checkpoint

Share a completed Workflow with its step graph.

## Source / attribution

Adapted from: Argo Workflows docs
