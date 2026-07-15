# Horizontal Pod Autoscaling

Track: Elective  |  Estimated time: 1.5h  |  Primary tool: HPA/metrics-server  |  Type: Lab

Grading: manual. There is no autograder for this lab; your mentor reviews your show-off checkpoint in your PLG space.

## Objective

Scale a workload automatically on CPU load.

## Your task

Install metrics-server, add resource requests to a Deployment, create an HPA targeting CPU, then generate load and watch it scale out and back in.

## Show-off checkpoint

Share 'kubectl get hpa' during load showing replicas increasing.

## Source / attribution

Adapted from: kubelabs Autoscaler101
