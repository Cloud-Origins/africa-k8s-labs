# CNI & eBPF Networking (Cilium)

Track: Elective (optional)  |  Estimated time: 3h  |  Primary tool: Cilium  |  Category: Networking  |  Type: Lab

Grading: manual. This elective installs and drives real ecosystem tooling; your mentor reviews your show-off checkpoint. Some tools are heavy or need a cloud account, so they are optional and run at your own pace.

## Objective

Replace the default CNI with Cilium and enforce identity-aware network policy with eBPF.

## Your task

On a fresh cluster, install Cilium as the CNI, deploy an app, and apply a CiliumNetworkPolicy that allows only specific pod-to-pod traffic; verify enforcement.

## Starting point (premade)

Install the tool, then build your task on top of it:

```bash
cilium install && cilium status --wait
```

Follow the official quickstart for current versions and full steps: https://docs.cilium.io/en/stable/gettingstarted/

## Show-off checkpoint

Share a CiliumNetworkPolicy blocking traffic (a denied curl) and 'cilium status' healthy.

## Source / attribution

Adapted from: Cilium docs
