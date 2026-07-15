# Secret Encryption (Sealed Secrets)

Track: Elective (optional)  |  Estimated time: 2h  |  Primary tool: Sealed Secrets  |  Category: Security / Secrets  |  Type: Lab

Grading: manual. This elective installs and drives real ecosystem tooling; your mentor reviews your show-off checkpoint. Some tools are heavy or need a cloud account, so they are optional and run at your own pace.

## Objective

Store secrets safely in Git by encrypting them into SealedSecrets.

## Your task

Install the Sealed Secrets controller and kubeseal, encrypt a Secret into a SealedSecret, commit it, apply it, and confirm the controller decrypts it into a real Secret.

## Starting point (premade)

Install the tool, then build your task on top of it:

```bash
kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/latest/download/controller.yaml
```

Follow the official quickstart for current versions and full steps: https://github.com/bitnami-labs/sealed-secrets

## Show-off checkpoint

Share a SealedSecret manifest (safe to commit) and the decrypted Secret the controller created.

## Source / attribution

Adapted from: Sealed Secrets docs
