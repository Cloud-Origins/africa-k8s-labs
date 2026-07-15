# ConfigMaps & Secrets

Track: KCNA, CKAD  |  Estimated time: 2h  |  Primary tool: kubectl  |  Type: Lab

## Objective

Externalize configuration with a ConfigMap and sensitive values with a Secret, then consume both in a Pod as environment variables.

## Your task

Put your YAML in `submission/`.

1. Create a ConfigMap named `app-config` with key `APP_MODE=production`.
2. Create a Secret named `app-secret` (type Opaque) with key `API_KEY=s3cr3t` (you may use `stringData`).
3. Create a Pod named `configured` (image `nginx:1.27`) with two env vars:
   - `APP_MODE` from the ConfigMap key `APP_MODE`
   - `API_KEY` from the Secret key `API_KEY`

## Steps

1. Write `submission/config.yaml`.
2. Test locally, then verify: `kubectl exec configured -- printenv APP_MODE API_KEY`
3. Commit and push.

## Show-off checkpoint

Share `kubectl exec configured -- printenv APP_MODE` (shows `production`) — and explain in one line why `API_KEY` belongs in a Secret, not a ConfigMap.

## Source / attribution

Adapted from: courselabs configmaps/secrets; Fast-Kubernetes configmap/secret; kubelabs ConfigMaps101/Secrets101
