# KCNA Fundamentals Quiz

Answer these, then check with your mentor. They cover the KCNA domains: Kubernetes fundamentals, container orchestration, cloud native architecture, observability, and application delivery.

## Kubernetes architecture

1. Name the four control-plane components and say what each does.
2. Which control-plane component is the only one that writes to and reads from etcd directly?
3. What runs on every worker node to manage pod lifecycle, and what talks to the container runtime through the CRI?
4. What is the smallest deployable unit in Kubernetes, and can it hold more than one container?

## Workloads

5. What does a Deployment give you that a bare ReplicaSet does not?
6. Which workload object runs one pod per node, and name a typical use.
7. Which workload gives pods stable names and per-pod storage?
8. What is the difference between a Job and a CronJob?

## Networking & config

9. What are the differences between ClusterIP, NodePort and LoadBalancer Service types?
10. How does a Service know which pods to send traffic to?
11. When should a value go in a Secret rather than a ConfigMap?
12. What does a NetworkPolicy do, and what must the cluster have for it to be enforced?

## Cloud native & observability

13. What is the CNCF, and name two graduated projects.
14. What is the container runtime interface (CRI) and name one compliant runtime.
15. Name the three pillars of observability and give a Kubernetes example of each.

## Delivery

16. What problem does Helm solve?
17. In one sentence, what is GitOps?

Grading: manual. Bring your answers and your self-scored weak areas to your mentor.
