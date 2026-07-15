# Container Registry (Harbor)

Track: Elective (optional)  |  Estimated time: 2.5h  |  Primary tool: Harbor  |  Category: Platform / Supply chain  |  Type: Lab

Grading: manual. This elective installs and drives real ecosystem tooling; your mentor reviews your show-off checkpoint. Some tools are heavy or need a cloud account, so they are optional and run at your own pace.

## Objective

Run a private image registry with scanning and RBAC.

## Your task

Install Harbor via Helm, create a project, push an image to it, and view the vulnerability scan results Harbor produces.

## Starting point (premade)

Install the tool, then build your task on top of it:

```bash
helm repo add harbor https://helm.goharbor.io && helm install harbor harbor/harbor -n harbor --create-namespace
```

Follow the official quickstart for current versions and full steps: https://goharbor.io/docs/

## Show-off checkpoint

Share a pushed image in a Harbor project with its scan report.

## Source / attribution

Adapted from: Harbor docs
