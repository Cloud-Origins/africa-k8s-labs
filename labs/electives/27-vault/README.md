# Secrets Management (HashiCorp Vault)

Track: Elective (optional)  |  Estimated time: 3h  |  Primary tool: Vault  |  Category: Security / Secrets  |  Type: Lab

Grading: manual. This elective installs and drives real ecosystem tooling; your mentor reviews your show-off checkpoint. Some tools are heavy or need a cloud account, so they are optional and run at your own pace.

## Objective

Run Vault in-cluster and inject secrets into pods.

## Your task

Install Vault via Helm in dev mode, enable the Kubernetes auth method, write a secret, and use the Vault Agent injector annotations to mount it into a pod.

## Starting point (premade)

Install the tool, then build your task on top of it:

```bash
helm repo add hashicorp https://helm.releases.hashicorp.com && helm install vault hashicorp/vault --set server.dev.enabled=true
```

Follow the official quickstart for current versions and full steps: https://developer.hashicorp.com/vault/tutorials/kubernetes/kubernetes-sidecar

## Show-off checkpoint

Share a pod with a Vault-injected secret file mounted at /vault/secrets.

## Source / attribution

Adapted from: Vault docs
