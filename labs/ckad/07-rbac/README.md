# RBAC & Security Contexts

Track: CKAD  |  Estimated time: 2.5h  |  Primary tool: kubectl  |  Type: Lab

## Objective

Grant least-privilege access with a ServiceAccount, a Role, and a RoleBinding.

## Your task

Put your YAML in `submission/`. All objects are namespaced; the autograder applies them into the lab namespace.

1. Create a ServiceAccount named `deployer`.
2. Create a Role named `pod-reader` allowing `get`, `list`, `watch` on `pods` (core API group).
3. Create a RoleBinding named `deployer-can-read` binding `deployer` to `pod-reader`.

## Steps

1. Write `submission/rbac.yaml` (do not hard-code a namespace; let the grader place them).
2. Test locally:
   ```bash
   kubectl auth can-i list pods --as=system:serviceaccount:default:deployer
   ```
3. Commit and push.

## Show-off checkpoint

Share two `kubectl auth can-i` results as the `deployer` SA: `list pods` (yes) and `delete pods` (no), proving least privilege.

## Source / attribution

Adapted from: courselabs rbac; kubelabs RBAC101/Security101
