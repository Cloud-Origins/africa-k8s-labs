# Config Management (Kustomize)

Track: CKAD, Elective  |  Estimated time: 1.5h  |  Primary tool: kubectl (built-in kustomize)  |  Type: Lab

## Objective

Customize plain manifests without templating using Kustomize (built into `kubectl` via `-k`). You will transform a base Deployment with a name prefix, a label, and a replica override.

## Your task

Put your files in `submission/`. The autograder runs `kubectl apply -k submission/`.

1. Add a base `submission/deployment.yaml`: a Deployment named `web` (image `nginx:1.27`, `1` replica, label `app: web`).
2. Add `submission/kustomization.yaml` that:
   - includes `deployment.yaml` under `resources`
   - sets `namePrefix: prod-`
   - adds the label `tier: frontend` (do not include it in selectors)
   - overrides the Deployment to `3` replicas via the `replicas:` transformer

After `kubectl apply -k`, the cluster should have a Deployment named `prod-web` with 3 replicas carrying the label `tier: frontend`.

## Steps

1. Write the two files in `submission/`.
2. Preview the rendered output before applying:
   ```bash
   kubectl kustomize submission/
   kubectl apply -k submission/
   kubectl get deploy prod-web --show-labels
   ```
3. Commit and push.

## Show-off checkpoint

Share the `kubectl kustomize submission/` rendered output next to `kubectl get deploy prod-web --show-labels`, showing the prefix, replica count, and label all applied.

## Source / attribution

Adapted from: kubelabs config management; Kustomize official docs
