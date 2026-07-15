# Distributed App Runtime (Dapr)

Track: Elective (optional)  |  Estimated time: 2.5h  |  Primary tool: Dapr  |  Category: Platform / App runtime  |  Type: Lab

Grading: manual. This elective installs and drives real ecosystem tooling; your mentor reviews your show-off checkpoint. Some tools are heavy or need a cloud account, so they are optional and run at your own pace.

## Objective

Add building blocks (state, pub/sub, service invocation) to apps with Dapr sidecars.

## Your task

Install Dapr on the cluster, annotate an app for the Dapr sidecar, and use a state store or pub/sub building block between two services.

## Starting point (premade)

Install the tool, then build your task on top of it:

```bash
dapr init -k
```

Follow the official quickstart for current versions and full steps: https://docs.dapr.io/getting-started/install-dapr-kubernetes/

## Show-off checkpoint

Share two services communicating via a Dapr building block (state save/get or pub/sub).

## Source / attribution

Adapted from: Dapr docs
