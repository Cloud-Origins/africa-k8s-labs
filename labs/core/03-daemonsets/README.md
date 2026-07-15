# DaemonSets

Track: KCNA, CKAD  |  Estimated time: 1h  |  Primary tool: kubectl  |  Type: Lab

## Objective

Run a pod on every node using a DaemonSet (the pattern used for log collectors and node agents).

## Your task

Put your YAML in `submission/`.

Create a DaemonSet named `node-logger`:
- image `busybox:1.36`
- a keep-alive command such as `sh -c "tail -f /dev/null"`
- pod label `app: node-logger`

## Steps

1. Write `submission/daemonset.yaml`.
2. Test locally: `kubectl apply -f submission/daemonset.yaml && kubectl get ds node-logger`
3. Confirm `DESIRED` equals `READY`.
4. Commit and push.

## Show-off checkpoint

Share `kubectl get ds node-logger -o wide` and `kubectl get pods -l app=node-logger -o wide` showing one pod per node.

## Source / attribution

Adapted from: courselabs; Fast-Kubernetes; kubelabs DaemonSet101
