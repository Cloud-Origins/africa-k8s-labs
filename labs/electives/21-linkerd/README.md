# Service Mesh (Linkerd)

Track: Elective (optional)  |  Estimated time: 3h  |  Primary tool: Linkerd  |  Category: Networking / Mesh  |  Type: Lab

Grading: manual. This elective installs and drives real ecosystem tooling; your mentor reviews your show-off checkpoint. Some tools are heavy or need a cloud account, so they are optional and run at your own pace.

## Objective

Add mTLS, retries and golden-metrics to services with a lightweight service mesh.

## Your task

Install Linkerd, mesh a namespace by adding the linkerd.io/inject annotation, deploy a two-service app, and view live traffic metrics in the Linkerd viz dashboard.

## Starting point (premade)

Install the tool, then build your task on top of it:

```bash
curl -sL https://run.linkerd.io/install | sh && linkerd install --crds | kubectl apply -f - && linkerd install | kubectl apply -f -
```

Follow the official quickstart for current versions and full steps: https://linkerd.io/2/getting-started/

## Show-off checkpoint

Share 'linkerd viz stat deploy' output showing success rate and RPS for your meshed services.

## Source / attribution

Adapted from: Linkerd docs; kubelabs ServiceMesh101
