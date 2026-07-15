# Nodes & Cluster Components

Track: KCNA  |  Estimated time: 1h  |  Primary tool: kubectl  |  Type: Lab

Grading: manual. There is no autograder for this lab; your mentor reviews your show-off checkpoint in your PLG space.

## Objective

Understand what runs a Kubernetes cluster: nodes and control-plane components.

## Your task

Inspect your cluster: list nodes with wide output, describe a node (capacity, conditions, kubelet version), then list the control-plane pods in the kube-system namespace and identify the API server, scheduler, controller-manager, etcd, kube-proxy and the CNI. Write a short note mapping each component to its job.

## Show-off checkpoint

Share an annotated screenshot of 'kubectl get pods -n kube-system -o wide' labelling each control-plane component and what it does.

## Source / attribution

Adapted from: courselabs nodes
