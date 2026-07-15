# Network Policies & Cluster Networking

Track: KCNA, CKAD  |  Estimated time: 2h  |  Primary tool: kubectl  |  Type: Lab

## Objective

Restrict pod-to-pod traffic with NetworkPolicies: a default-deny baseline plus a targeted allow rule.

Note on grading: the autograder checks that your NetworkPolicy objects are correct. Enforcement is NOT tested here because the default kind CNI (kindnet) does not enforce NetworkPolicy — test enforcement locally on a cluster with Calico or Cilium.

## Your task

Put your YAML in `submission/`.

1. Create a NetworkPolicy named `default-deny-ingress`:
   - selects all pods (`podSelector: {}`)
   - `policyTypes: [Ingress]` with no ingress rules (deny all inbound)
2. Create a NetworkPolicy named `allow-web`:
   - selects pods `app: web`
   - allows ingress from pods `role: frontend` on TCP port `80`

## Steps

1. Write `submission/netpol.yaml`.
2. Locally on Calico/Cilium, verify a `role=frontend` pod can reach `app=web` on 80 while others cannot.
3. Commit and push.

## Show-off checkpoint

On a Calico cluster, share two `wget` attempts to an `app=web` pod: one from a `role=frontend` pod (succeeds) and one from another pod (times out).

## Source / attribution

Adapted from: courselabs networkpolicy; kubelabs Network_Policies101/ClusterNetworking101
