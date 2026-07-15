# Pods & Multi-container Patterns

Track: KCNA, CKAD  |  Estimated time: 2h  |  Primary tool: kubectl  |  Type: Lab

## Objective

Create Pods directly and learn the multi-container (sidecar) pattern: two containers sharing a volume in one Pod.

## Your task

Put your YAML in the `submission/` folder. When you push, the autograder applies it to a throwaway cluster and checks the result.

1. Create a Pod named `web`:
   - image `nginx:1.27`
   - label `app: web`
   - a container port `80`

2. Create a Pod named `sidecar-demo` with two containers sharing an `emptyDir` volume named `logs`:
   - container `app`: image `nginx:1.27`, mounts `logs` at `/var/log/shared`
   - container `logger`: image `busybox:1.36`, mounts `logs` at `/var/log/shared`, and runs a command that keeps the container alive (for example, `sh -c "tail -f /dev/null"`)

## Steps

1. Create `submission/pods.yaml`.
2. Write the two Pod manifests (you can put both in one file separated by `---`).
3. Test locally first (see [../../../SETUP.md](../../../SETUP.md)):
   ```bash
   kubectl apply -f submission/pods.yaml
   kubectl get pods
   kubectl describe pod sidecar-demo
   ```
4. Commit and push. Watch the Actions tab for your grade.

## Show-off checkpoint

Run `kubectl get pods -o wide` and share a screenshot in your PLG space showing both Pods `Running`, plus the output of `kubectl exec sidecar-demo -c logger -- ls /var/log/shared`.

## Hints

- `kubectl run web --image=nginx:1.27 --port=80 --labels=app=web --dry-run=client -o yaml` gives you a starting manifest.
- A container needs a long-running process or it will restart; `tail -f /dev/null` is a common keep-alive.

## Source / attribution

Adapted from: courselabs pods; Fast-Kubernetes pod imperative/declarative/sidecar; kubelabs pods101
