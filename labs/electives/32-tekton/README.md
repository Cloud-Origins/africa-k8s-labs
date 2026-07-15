# CI/CD Pipelines (Tekton)

Track: Elective (optional)  |  Estimated time: 3h  |  Primary tool: Tekton  |  Category: CI/CD  |  Type: Lab

Grading: manual. This elective installs and drives real ecosystem tooling; your mentor reviews your show-off checkpoint. Some tools are heavy or need a cloud account, so they are optional and run at your own pace.

## Objective

Build cloud-native pipelines that run as Kubernetes resources.

## Your task

Install Tekton Pipelines, define a Task and a Pipeline (for example clone then build), and run it with a PipelineRun.

## Starting point (premade)

Install the tool, then build your task on top of it:

```bash
kubectl apply -f https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
```

Follow the official quickstart for current versions and full steps: https://tekton.dev/docs/installation/pipelines/

## Show-off checkpoint

Share a successful PipelineRun and its TaskRun logs.

## Source / attribution

Adapted from: Tekton docs
