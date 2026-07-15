# Distributed Tracing (OpenTelemetry + Jaeger)

Track: Elective (optional)  |  Estimated time: 2.5h  |  Primary tool: OpenTelemetry/Jaeger  |  Category: Observability  |  Type: Lab

Grading: manual. This elective installs and drives real ecosystem tooling; your mentor reviews your show-off checkpoint. Some tools are heavy or need a cloud account, so they are optional and run at your own pace.

## Objective

Capture and view distributed traces across services.

## Your task

Install the OpenTelemetry Operator/Collector and Jaeger, instrument or route traces from a sample app, and explore a trace end to end in the Jaeger UI.

## Starting point (premade)

Install the tool, then build your task on top of it:

```bash
kubectl apply -f https://github.com/open-telemetry/opentelemetry-operator/releases/latest/download/opentelemetry-operator.yaml
```

Follow the official quickstart for current versions and full steps: https://opentelemetry.io/docs/kubernetes/

## Show-off checkpoint

Share a Jaeger trace waterfall spanning at least two services.

## Source / attribution

Adapted from: OpenTelemetry & Jaeger docs
