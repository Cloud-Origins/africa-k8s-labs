# Policy (OPA Gatekeeper)

Track: Elective (optional)  |  Estimated time: 2.5h  |  Primary tool: OPA Gatekeeper  |  Category: Security / Policy  |  Type: Lab

Grading: manual. This elective installs and drives real ecosystem tooling; your mentor reviews your show-off checkpoint. Some tools are heavy or need a cloud account, so they are optional and run at your own pace.

## Objective

Enforce policy with OPA Gatekeeper (an alternative to Kyverno) using ConstraintTemplates.

## Your task

Install Gatekeeper, define a ConstraintTemplate + Constraint requiring a label on namespaces (or disallowing :latest images), and prove it blocks a violating resource.

## Starting point (premade)

Install the tool, then build your task on top of it:

```bash
kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/master/deploy/gatekeeper.yaml
```

Follow the official quickstart for current versions and full steps: https://open-policy-agent.github.io/gatekeeper/website/docs/install

## Show-off checkpoint

Share Gatekeeper rejecting a non-compliant resource with the constraint's message.

## Source / attribution

Adapted from: Gatekeeper docs
