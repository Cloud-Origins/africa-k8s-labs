# External Secrets Operator

Track: Elective (optional)  |  Estimated time: 2.5h  |  Primary tool: External Secrets  |  Category: Security / Secrets  |  Type: Lab

Grading: manual. This elective installs and drives real ecosystem tooling; your mentor reviews your show-off checkpoint. Some tools are heavy or need a cloud account, so they are optional and run at your own pace.

## Objective

Sync secrets from an external store (Vault, cloud secret manager) into Kubernetes.

## Your task

Install the External Secrets Operator, configure a SecretStore, and create an ExternalSecret that materializes a Kubernetes Secret from the backend.

## Starting point (premade)

Install the tool, then build your task on top of it:

```bash
helm repo add external-secrets https://charts.external-secrets.io && helm install external-secrets external-secrets/external-secrets -n external-secrets --create-namespace
```

Follow the official quickstart for current versions and full steps: https://external-secrets.io/latest/introduction/getting-started/

## Show-off checkpoint

Share the ExternalSecret and the synced Secret it created from your backend.

## Source / attribution

Adapted from: External Secrets docs
