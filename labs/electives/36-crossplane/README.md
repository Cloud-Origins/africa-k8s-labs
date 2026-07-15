# Control Plane / IaC (Crossplane)

Track: Elective (optional)  |  Estimated time: 3h  |  Primary tool: Crossplane  |  Category: Platform / IaC  |  Type: Lab

Grading: manual. This elective installs and drives real ecosystem tooling; your mentor reviews your show-off checkpoint. Some tools are heavy or need a cloud account, so they are optional and run at your own pace.

## Objective

Provision and compose infrastructure using Kubernetes as the control plane.

## Your task

Install Crossplane, add a provider, and create a managed resource (or a simple Composition) declaratively via the Kubernetes API.

## Starting point (premade)

Install the tool, then build your task on top of it:

```bash
helm repo add crossplane-stable https://charts.crossplane.io/stable && helm install crossplane crossplane-stable/crossplane -n crossplane-system --create-namespace
```

Follow the official quickstart for current versions and full steps: https://docs.crossplane.io/latest/software/install/

## Show-off checkpoint

Share a Crossplane managed resource reaching READY/SYNCED.

## Source / attribution

Adapted from: Crossplane docs
