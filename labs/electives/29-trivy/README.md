# Image & Cluster Scanning (Trivy)

Track: Elective (optional)  |  Estimated time: 2h  |  Primary tool: Trivy  |  Category: Security / Supply chain  |  Type: Lab

Grading: manual. This elective installs and drives real ecosystem tooling; your mentor reviews your show-off checkpoint. Some tools are heavy or need a cloud account, so they are optional and run at your own pace.

## Objective

Scan images and cluster workloads for vulnerabilities and misconfigurations.

## Your task

Install the Trivy Operator (or run the Trivy CLI), scan a deployed workload, and review the VulnerabilityReport/ConfigAuditReport it produces.

## Starting point (premade)

Install the tool, then build your task on top of it:

```bash
helm repo add aqua https://aquasecurity.github.io/helm-charts && helm install trivy-operator aqua/trivy-operator -n trivy-system --create-namespace
```

Follow the official quickstart for current versions and full steps: https://aquasecurity.github.io/trivy

## Show-off checkpoint

Share a VulnerabilityReport for one of your workloads with its severity counts.

## Source / attribution

Adapted from: Trivy docs
