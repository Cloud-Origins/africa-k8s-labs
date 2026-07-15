# StatefulSets

Track: KCNA, CKAD  |  Estimated time: 2h  |  Primary tool: kubectl  |  Type: Lab

## Objective

Run stateful pods with stable network identities and per-pod persistent storage using a StatefulSet and a headless Service.

## Your task

Put your YAML in `submission/`.

1. Create a headless Service named `data`:
   - `clusterIP: None`
   - selector `app: data`, port `80`
2. Create a StatefulSet named `data`:
   - `2` replicas
   - `serviceName: data`
   - image `nginx:1.27`, pod label `app: data`
   - a `volumeClaimTemplate` named `www` requesting `1Gi` (ReadWriteOnce)

## Steps

1. Write `submission/statefulset.yaml` (Service and StatefulSet, separated by `---`).
2. Test locally: `kubectl apply -f submission/statefulset.yaml && kubectl get sts,pods,pvc`
3. Confirm pods are named `data-0`, `data-1` and each has its own PVC.
4. Commit and push.

## Show-off checkpoint

Share `kubectl get pods -l app=data` (showing ordered names `data-0`, `data-1`) and `kubectl get pvc` (showing one PVC per pod).

## Source / attribution

Adapted from: courselabs; Fast-Kubernetes; kubelabs StatefulSets101
