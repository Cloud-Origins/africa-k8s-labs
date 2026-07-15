# GitOps (Flux)

Track: Elective (optional)  |  Estimated time: 3h  |  Primary tool: Flux  |  Category: GitOps / CD  |  Type: Lab

Grading: manual. This elective installs and drives real ecosystem tooling; your mentor reviews your show-off checkpoint. Some tools are heavy or need a cloud account, so they are optional and run at your own pace.

## Objective

Continuously reconcile the cluster from Git using Flux (an alternative to Argo CD).

## Your task

Install Flux, point a GitRepository + Kustomization at a repo of manifests, commit a change to Git, and watch Flux apply it automatically.

## Starting point (premade)

Install the tool, then build your task on top of it:

```bash
flux install
```

Follow the official quickstart for current versions and full steps: https://fluxcd.io/flux/get-started/

## Show-off checkpoint

Share 'flux get kustomizations' Ready=True after a Git-driven change reconciled to the cluster.

## Source / attribution

Adapted from: Flux docs
