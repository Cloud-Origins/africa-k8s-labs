# Init Containers

Track: CKAD  |  Estimated time: 1h  |  Primary tool: kubectl  |  Type: Lab

## Objective

Use an init container to prepare data before the main application container starts.

## Your task

Put your YAML in `submission/`.

Create a Pod named `app-with-init`:
- an `emptyDir` volume named `work`
- an init container `setup` (image `busybox:1.36`) that writes an HTML file into the shared volume, e.g. `sh -c "echo '<h1>Ready</h1>' > /work/index.html"`, mounting `work` at `/work`
- a main container `app` (image `nginx:1.27`) mounting `work` at `/usr/share/nginx/html`

## Steps

1. Write `submission/init.yaml`.
2. Test locally: `kubectl apply -f submission/init.yaml && kubectl get pod app-with-init`
3. Confirm the pod becomes `Running` only after the init container completes.
4. Commit and push.

## Show-off checkpoint

Share `kubectl exec app-with-init -c app -- cat /usr/share/nginx/html/index.html` showing the file the init container produced.

## Source / attribution

Adapted from: kubelabs InitContainers101
