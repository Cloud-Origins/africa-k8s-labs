# Scheduling: Affinity, Taints & Tolerations

Track: KCNA, CKAD  |  Estimated time: 2h  |  Primary tool: kubectl  |  Type: Lab

## Objective

Influence where pods land using node affinity and tolerations.

## Your task

Put your YAML in `submission/`.

Create a Pod named `pinned` (image `nginx:1.27`) that:
- uses `requiredDuringSchedulingIgnoredDuringExecution` node affinity requiring `kubernetes.io/os` In `[linux]`
- tolerates a taint with key `dedicated`, operator `Equal`, value `labs`, effect `NoSchedule`

## Steps

1. Write `submission/scheduling.yaml`.
2. Test locally: `kubectl apply -f submission/scheduling.yaml && kubectl get pod pinned -o wide`
3. The pod schedules on any Linux node; the toleration lets it also run on nodes tainted `dedicated=labs:NoSchedule`.
4. Commit and push.

## Show-off checkpoint

Taint your node (`kubectl taint nodes <node> dedicated=labs:NoSchedule`), reapply, and show `pinned` still schedules while a pod without the toleration stays `Pending`.

## Source / attribution

Adapted from: courselabs affinity; Fast-Kubernetes nodeaffinity/taint; kubelabs Scheduler101
