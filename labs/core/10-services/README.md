# Services

Track: KCNA, CKAD  |  Estimated time: 2h  |  Primary tool: kubectl  |  Type: Lab

## Objective

Expose a set of pods behind a stable virtual IP and DNS name with a ClusterIP Service.

## Your task

Put your YAML in `submission/`.

1. Create a Deployment named `web` (image `nginx:1.27`, `2` replicas, label `app: web`, container port `80`).
2. Create a Service named `web-svc`:
   - type `ClusterIP`
   - selector `app: web`
   - port `80`, targetPort `80`

## Steps

1. Write `submission/service.yaml`.
2. Test locally, then confirm endpoints are wired to your pods:
   ```bash
   kubectl get endpoints web-svc
   ```
3. Commit and push.

## Show-off checkpoint

From a temporary pod, resolve and curl the service by name and share the result:
```bash
kubectl run tmp --rm -it --image=busybox:1.36 --restart=Never -- wget -qO- web-svc
```

## Source / attribution

Adapted from: courselabs; Fast-Kubernetes; kubelabs Services101
