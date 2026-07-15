# Health Probes & Production Readiness

Track: KCNA, CKAD  |  Estimated time: 2h  |  Primary tool: kubectl  |  Type: Lab

## Objective

Make a workload self-healing and traffic-safe with liveness and readiness probes.

## Your task

Put your YAML in `submission/`.

Create a Deployment named `web` (image `nginx:1.27`, `2` replicas, label `app: web`) whose container has:
- a `livenessProbe`: HTTP GET `/` on port `80`, `initialDelaySeconds: 5`, `periodSeconds: 10`
- a `readinessProbe`: HTTP GET `/` on port `80`

## Steps

1. Write `submission/probes.yaml`.
2. Test locally: `kubectl apply -f submission/probes.yaml && kubectl describe deploy web | grep -A2 -i probe`
3. Commit and push.

## Show-off checkpoint

Explain in one line the difference between liveness (restart the container) and readiness (remove from Service endpoints) and share `kubectl get deploy web` showing 2/2 ready.

## Source / attribution

Adapted from: courselabs production readiness; Fast-Kubernetes liveness
