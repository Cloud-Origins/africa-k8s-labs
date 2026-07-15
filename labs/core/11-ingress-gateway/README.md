# Ingress & Gateway API

Track: KCNA, CKAD  |  Estimated time: 2.5h  |  Primary tool: kubectl/nginx  |  Type: Lab

## Objective

Route external HTTP traffic to services by host and path using an Ingress resource.

Note on grading: the autograder checks that your Ingress object is correct (host, path, backend). It does not run an ingress controller, so live routing is not tested here — do that locally with `minikube addons enable ingress` or `kind` + ingress-nginx.

## Your task

Put your YAML in `submission/`.

1. Create a Deployment `web` (image `nginx:1.27`, label `app: web`, port `80`) and a ClusterIP Service `web-svc` on port `80`.
2. Create an Ingress named `web-ing`:
   - `ingressClassName: nginx`
   - host `demo.local`
   - path `/` (pathType `Prefix`) routing to service `web-svc` port `80`

## Steps

1. Write `submission/ingress.yaml`.
2. Locally, install ingress-nginx, add `demo.local` to `/etc/hosts`, and curl it.
3. Commit and push.

## Show-off checkpoint

Share a `curl -H "Host: demo.local" <ingress-ip>` returning the nginx welcome page from your local cluster.

## Source / attribution

Adapted from: courselabs ingress; Fast-Kubernetes ingress; kubelabs Ingress101/Gateway101
