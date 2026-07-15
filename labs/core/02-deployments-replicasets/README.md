# Deployments & ReplicaSets

Track: KCNA, CKAD  |  Estimated time: 2h  |  Primary tool: kubectl  |  Type: Lab

## Objective

Manage a scalable, self-healing application with a Deployment (which manages a ReplicaSet for you).

## Your task

Put your YAML in `submission/`. The autograder applies it and checks the result.

Create a Deployment named `web`:
- image `nginx:1.27`
- `3` replicas
- pod label `app: web` (and a matching selector)
- container port `80`

## Steps

1. `kubectl create deployment web --image=nginx:1.27 --replicas=3 --dry-run=client -o yaml > submission/web.yaml`
2. Confirm the selector and pod template both use `app: web`, and add the container port.
3. Test locally: `kubectl apply -f submission/web.yaml && kubectl get deploy,rs,pods -l app=web`
4. Commit and push.

## Show-off checkpoint

Delete one pod (`kubectl delete pod <name>`) and share a screenshot showing the ReplicaSet immediately recreating it so 3 stay Running.

## Source / attribution

Adapted from: courselabs deployments; Fast-Kubernetes deployment/replicaset; kubelabs Deployment101/replicaset101/ReplicationController101
