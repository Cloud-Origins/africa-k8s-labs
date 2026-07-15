#!/usr/bin/env bash
# Scaffolds the africa-k8s-labs lab folders and track manifests from a metadata table.
# Idempotent: re-running only creates missing files; it never overwrites an existing README.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"

# group|slug|title|tracks|hours|tool|source
LABS=(
"core|01-pods|Pods & Multi-container Patterns|KCNA, CKAD|2|kubectl|courselabs pods; Fast-Kubernetes pod imperative/declarative/sidecar; kubelabs pods101"
"core|02-deployments-replicasets|Deployments & ReplicaSets|KCNA, CKAD|2|kubectl|courselabs deployments; Fast-Kubernetes deployment/replicaset; kubelabs Deployment101/replicaset101/ReplicationController101"
"core|03-daemonsets|DaemonSets|KCNA, CKAD|1|kubectl|courselabs; Fast-Kubernetes; kubelabs DaemonSet101"
"core|04-statefulsets|StatefulSets|KCNA, CKAD|2|kubectl|courselabs; Fast-Kubernetes; kubelabs StatefulSets101"
"core|05-jobs-cronjobs|Jobs & CronJobs|KCNA, CKAD|1.5|kubectl|courselabs; Fast-Kubernetes job/cronjob; kubelabs Jobs101/Cronjobs101"
"core|06-init-containers|Init Containers|CKAD|1|kubectl|kubelabs InitContainers101"
"core|07-configmaps-secrets|ConfigMaps & Secrets|KCNA, CKAD|2|kubectl|courselabs configmaps/secrets; Fast-Kubernetes configmap/secret; kubelabs ConfigMaps101/Secrets101"
"core|08-namespaces-resourcequotas|Namespaces & Resource Quotas|KCNA, CKAD|1.5|kubectl|courselabs namespaces; kubelabs ResourceQuota101"
"core|09-labels-selectors|Labels & Selectors|KCNA, CKAD|1|kubectl|kubelabs Labels&Selectors"
"core|10-services|Services|KCNA, CKAD|2|kubectl|courselabs; Fast-Kubernetes; kubelabs Services101"
"core|11-ingress-gateway|Ingress & Gateway API|KCNA, CKAD|2.5|kubectl/nginx|courselabs ingress; Fast-Kubernetes ingress; kubelabs Ingress101/Gateway101"
"core|12-network-policies|Network Policies & Cluster Networking|KCNA, CKAD|2|kubectl|courselabs networkpolicy; kubelabs Network_Policies101/ClusterNetworking101"
"core|13-persistent-storage|Persistent Storage (PV/PVC)|KCNA, CKAD|2|kubectl|courselabs persistentvolumes; Fast-Kubernetes persistentvolume"
"core|14-scheduling|Scheduling: Affinity, Taints & Tolerations|KCNA, CKAD|2|kubectl|courselabs affinity; Fast-Kubernetes nodeaffinity/taint; kubelabs Scheduler101"
"core|15-health-probes|Health Probes & Production Readiness|KCNA, CKAD|2|kubectl|courselabs production readiness; Fast-Kubernetes liveness"
"core|16-nodes-components|Nodes & Cluster Components|KCNA|1|kubectl|courselabs nodes"
"core|17-kubectl-tooling|kubectl Tooling, Contexts & Dashboard|KCNA, CKAD|1.5|kubectl|courselabs tools; kubelabs context; Fast-Kubernetes dashboard"
"core|18-monitoring|Monitoring (Prometheus & Grafana)|KCNA, CKAD|2.5|Prometheus/Grafana|courselabs; Fast-Kubernetes; kubelabs Monitoring101/Observability101"
"core|19-helm|Helm Packaging|KCNA, CKAD|2.5|Helm|courselabs; Fast-Kubernetes; kubelabs helm/Helm101"
"kcna|01-fundamentals-quiz|Kubernetes Fundamentals Quiz Bank|KCNA|1|n/a|kubelabs slides + docker-vs-k8s + cheat sheets"
"ckad|01-container-images|Container Images: Build & Optimize|CKAD|2|Docker/BuildKit|courselabs image optimizing/buildkit"
"ckad|02-rollouts-bluegreen|Progressive Delivery: Rollouts & Blue/Green|CKAD|2|Argo Rollouts|courselabs rollouts; kubelabs Rollouts101/bluegreen"
"ckad|03-gitops-argocd|GitOps with ArgoCD|CKAD|3|ArgoCD|courselabs argo; kubelabs GitOps101"
"ckad|04-cicd-jenkins|CI/CD with Jenkins|CKAD|3|Jenkins|courselabs jenkins; Fast-Kubernetes helm-jenkins; kubelabs Jenkins101"
"ckad|05-cicd-gitlab|CI/CD with GitLab|CKAD|2.5|GitLab|kubelabs GitLab101"
"ckad|06-api-clients|Kubernetes API Clients (Go/Python/Java - pick one)|CKAD|2.5|client libraries|kubelabs golang/python/JavaClient101"
"ckad|07-rbac|RBAC & Security Contexts|CKAD|2.5|kubectl|courselabs rbac; kubelabs RBAC101/Security101"
"ckad|08-admission-kyverno|Admission Control & Policy (Kyverno)|CKAD|2.5|Kyverno|courselabs admission; kubelabs Kyverno101"
"electives|01-cluster-setup|Cluster Setup (kubeadm/k3s/k3d)|Elective|3|kubeadm/k3s|courselabs clusters; Fast-Kubernetes kubeadm; kubelabs install/k3s"
"electives|02-service-mesh|Service Mesh (Istio)|Elective|3|Istio|kubelabs ServiceMesh101"
"electives|03-hpa|Horizontal Pod Autoscaling|Elective|1.5|HPA/metrics-server|kubelabs Autoscaler101"
"electives|04-keda|Event-driven Autoscaling (KEDA)|Elective|2|KEDA|kubelabs Keda101"
"electives|05-karpenter|Node Autoscaling (Karpenter)|Elective|2.5|Karpenter|kubelabs Karpenter101"
"electives|06-troubleshooting|Troubleshooting|Elective|2.5|kubectl|courselabs troubleshooting"
"electives|07-chaos|Chaos Engineering|Elective|2.5|LitmusChaos|kubelabs Chaos101"
"electives|08-disaster-recovery|Disaster Recovery & Backup|Elective|2.5|Velero|kubelabs DisasterRecovery101"
"electives|09-logging|Logging (EFK stack)|Elective|2.5|Elasticsearch/Fluentd/Kibana|courselabs logging; kubelabs Logging101"
"electives|10-multi-tenancy|Multi-Tenancy|Elective|2|kubectl|kubelabs MultiTenant101/Kubezoo"
"electives|11-operators|Operators|Elective|3|Operator SDK|courselabs operators"
"electives|12-terraform|Infrastructure as Code (Terraform)|Elective|2.5|Terraform|kubelabs Terraform101"
"electives|13-managed-k8s|Managed Kubernetes (AKS/EKS/GKE/LKE - pick one)|Elective|3|cloud CLI|kubelabs AKS101/EKS101/GKE101/LKE101"
"electives|14-platform-tooling|Platform Tooling (KubeSphere/Loft/Shipa/Portainer/DevSpace - pick one)|Elective|2|varies|kubelabs KubeSphere/Loft101/Shipa101/portainer/DevSpace101"
"electives|15-strimzi-kafka|Kafka on Kubernetes (Strimzi)|Elective|2.5|Strimzi|kubelabs Strimzi101"
"electives|16-iot-edge|Kubernetes for IoT/Edge|Elective|2|kubectl|kubelabs IOT"
"electives|17-ai-ml|AI/ML on Kubernetes|Elective|2.5|kubectl|kubelabs ai"
"electives|18-cka-ckad-practice|CKA/CKAD Practice Exercises|Elective|6|kubectl|kubelabs cka/intermediate/201"
"electives|19-hackathon|Hackathon Capstone|Capstone|6|mixed|courselabs hackathon; Fast-Kubernetes end-to-end"
)

created=0
for row in "${LABS[@]}"; do
  IFS='|' read -r group slug title tracks hours tool source <<< "$row"
  dir="$ROOT/labs/$group/$slug"
  mkdir -p "$dir/manifests"
  [ -f "$dir/manifests/.gitkeep" ] || touch "$dir/manifests/.gitkeep"
  readme="$dir/README.md"
  if [ ! -f "$readme" ]; then
    if [ "$tool" = "n/a" ]; then type="Quiz"; else type="Lab"; fi
    cat > "$readme" <<EOF
# $title

Track: $tracks  |  Estimated time: ${hours}h  |  Primary tool: $tool  |  Type: $type

## Objective

_TODO: what the learner will build and demonstrate in this $type._

## Prerequisites

- A running local cluster (see [../../../SETUP.md](../../../SETUP.md))
- Recommended prior labs: _TODO_

## Steps

_TODO: port and adapt the steps from the source material below._

## Show-off checkpoint

_TODO: the concrete artifact or command output the learner shares in their PLG space to prove completion._

## Source / attribution

Adapted from: $source
EOF
    created=$((created+1))
  fi
done
echo "Lab folders ensured. New READMEs created: $created"
