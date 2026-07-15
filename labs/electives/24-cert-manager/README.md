# TLS Certificates (cert-manager)

Track: Elective (optional)  |  Estimated time: 2h  |  Primary tool: cert-manager  |  Category: Security / TLS  |  Type: Lab

Grading: manual. This elective installs and drives real ecosystem tooling; your mentor reviews your show-off checkpoint. Some tools are heavy or need a cloud account, so they are optional and run at your own pace.

## Objective

Automate issuing and renewing TLS certificates in the cluster.

## Your task

Install cert-manager, create a self-signed (or ACME staging) Issuer, request a Certificate for a hostname, and confirm the resulting TLS Secret is created.

## Starting point (premade)

Install the tool, then build your task on top of it:

```bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/latest/download/cert-manager.yaml
```

Follow the official quickstart for current versions and full steps: https://cert-manager.io/docs/installation/

## Show-off checkpoint

Share 'kubectl get certificate' Ready=True and the TLS Secret it produced.

## Source / attribution

Adapted from: cert-manager docs
