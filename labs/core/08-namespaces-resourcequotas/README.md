# Namespaces & Resource Quotas

Track: KCNA, CKAD  |  Estimated time: 1.5h  |  Primary tool: kubectl  |  Type: Lab

## Objective

Isolate workloads with a Namespace and cap its resource usage with a ResourceQuota.

## Your task

Put your YAML in `submission/`.

1. Create a Namespace named `team-a`.
2. Create a ResourceQuota named `compute` in namespace `team-a` with hard limits:
   - `requests.cpu: "1"`
   - `requests.memory: 1Gi`
   - `limits.cpu: "2"`
   - `limits.memory: 2Gi`

## Steps

1. Write `submission/quota.yaml` (Namespace and ResourceQuota, `metadata.namespace: team-a` on the quota).
2. Test locally: `kubectl apply -f submission/quota.yaml && kubectl describe resourcequota compute -n team-a`
3. Commit and push.

## Show-off checkpoint

Try to create a pod in `team-a` without resource requests and share the error the quota produces (it forces you to declare requests/limits).

## Source / attribution

Adapted from: courselabs namespaces; kubelabs ResourceQuota101
