# Labels & Selectors

Track: KCNA, CKAD  |  Estimated time: 1h  |  Primary tool: kubectl  |  Type: Lab

## Objective

Organize objects with labels and query them with selectors — the mechanism Services, Deployments, and almost everything else uses to find pods.

## Your task

Put your YAML in `submission/`. Create three Pods (all image `nginx:1.27`) with these labels:

| Pod name | Labels |
|---|---|
| `shop-prod` | `app: shop`, `env: prod` |
| `shop-dev` | `app: shop`, `env: dev` |
| `api-prod` | `app: api`, `env: prod` |

## Steps

1. Write `submission/pods.yaml`.
2. Test the selectors:
   ```bash
   kubectl get pods -l env=prod      # expect shop-prod, api-prod
   kubectl get pods -l app=shop      # expect shop-prod, shop-dev
   ```
3. Commit and push.

## Show-off checkpoint

Share the output of `kubectl get pods -l 'env=prod,app=shop'` and explain what the comma means (AND).

## Source / attribution

Adapted from: kubelabs Labels&Selectors
