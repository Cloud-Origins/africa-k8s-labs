# Persistent Storage (PV/PVC)

Track: KCNA, CKAD  |  Estimated time: 2h  |  Primary tool: kubectl  |  Type: Lab

## Objective

Request durable storage with a PersistentVolumeClaim and mount it into a pod. On kind/minikube a dynamic provisioner creates the PersistentVolume for you.

## Your task

Put your YAML in `submission/`.

1. Create a PersistentVolumeClaim named `data-pvc`:
   - accessMode `ReadWriteOnce`
   - request `1Gi` (use the cluster default StorageClass — do not set `storageClassName`)
2. Create a Pod named `writer` (image `nginx:1.27`) that mounts `data-pvc` at `/data`.

## Steps

1. Write `submission/storage.yaml`.
2. Test locally: `kubectl apply -f submission/storage.yaml && kubectl get pvc,pod`
3. Confirm the PVC becomes `Bound` once the pod is scheduled (kind binds on first consumer).
4. Commit and push.

## Show-off checkpoint

Write a file into the volume, delete and recreate the pod, and show the file survived:
```bash
kubectl exec writer -- sh -c "echo hi > /data/keep.txt"
```

## Source / attribution

Adapted from: courselabs persistentvolumes; Fast-Kubernetes persistentvolume
