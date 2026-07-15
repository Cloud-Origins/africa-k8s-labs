# Local Cluster Setup

You run every lab on a local single-node cluster. Pick one option below. All labs are tested to work on any of them.

## Prerequisites

- A machine with at least 4 GB RAM free (8 GB recommended)
- Docker Desktop (macOS/Windows) or Docker Engine (Linux)
- `kubectl` — the Kubernetes command-line tool

Install `kubectl`: https://kubernetes.io/docs/tasks/tools/

## Option A: kind (Kubernetes in Docker) — recommended

Lightweight, fast, disposable.

```bash
# Install (macOS)
brew install kind
# Linux
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.23.0/kind-linux-amd64 && chmod +x kind && sudo mv kind /usr/local/bin/

# Create and verify
kind create cluster --name k8s-labs
kubectl cluster-info --context kind-k8s-labs
kubectl get nodes
```

## Option B: minikube

```bash
brew install minikube        # macOS
minikube start
kubectl get nodes
```

## Option C: k3d (k3s in Docker)

Needed for some advanced/electives labs.

```bash
brew install k3d
k3d cluster create k8s-labs
kubectl get nodes
```

## Verify your setup

```bash
kubectl version --output=yaml
kubectl get nodes          # node should be Ready
kubectl run test --image=nginx --restart=Never && kubectl get pod test
kubectl delete pod test
```

If `kubectl get nodes` shows a `Ready` node, you are ready to start your track.

## Cleaning up

```bash
kind delete cluster --name k8s-labs     # kind
minikube delete                          # minikube
k3d cluster delete k8s-labs              # k3d
```

## Notes

- Some electives (managed Kubernetes, Karpenter) target a cloud provider and cannot run on a local cluster; their README says so.
- If a lab leaves resources behind, delete its namespace to reset: `kubectl delete namespace <name>`.
