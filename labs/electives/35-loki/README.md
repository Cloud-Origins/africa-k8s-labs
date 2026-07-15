# Logging (Grafana Loki)

Track: Elective (optional)  |  Estimated time: 2.5h  |  Primary tool: Loki  |  Category: Observability  |  Type: Lab

Grading: manual. This elective installs and drives real ecosystem tooling; your mentor reviews your show-off checkpoint. Some tools are heavy or need a cloud account, so they are optional and run at your own pace.

## Objective

Aggregate and query logs with Grafana Loki (an alternative to EFK).

## Your task

Install Loki + Promtail (or Grafana Agent) with Helm, wire it to Grafana, and run a LogQL query for a specific pod or error string.

## Starting point (premade)

Install the tool, then build your task on top of it:

```bash
helm repo add grafana https://grafana.github.io/helm-charts && helm install loki grafana/loki-stack -n logging --create-namespace
```

Follow the official quickstart for current versions and full steps: https://grafana.com/docs/loki/latest/setup/install/helm/

## Show-off checkpoint

Share a Grafana LogQL query surfacing logs from a specific pod.

## Source / attribution

Adapted from: Grafana Loki docs
