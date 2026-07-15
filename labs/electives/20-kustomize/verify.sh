#!/usr/bin/env bash
# Verifier for the Kustomize lab. Usage: verify.sh <namespace>
set -uo pipefail
NS="${1:-default}"
pass=0; fail=0
ck(){ if eval "$2" >/dev/null 2>&1; then echo "PASS: $1"; pass=$((pass+1)); else echo "FAIL: $1"; fail=$((fail+1)); fi; }

kubectl -n "$NS" rollout status deploy/prod-web --timeout=90s >/dev/null 2>&1 || true

ck "Deployment 'prod-web' exists (namePrefix applied)" "kubectl -n $NS get deploy prod-web"
ck "Deployment 'prod-web' has 3 ready (replicas override)" "[ \"\$(kubectl -n $NS get deploy prod-web -o jsonpath='{.status.readyReplicas}')\" = 3 ]"
ck "Deployment 'prod-web' has label tier=frontend"   "[ \"\$(kubectl -n $NS get deploy prod-web -o jsonpath='{.metadata.labels.tier}')\" = frontend ]"
ck "Deployment uses nginx:1.27"                       "kubectl -n $NS get deploy prod-web -o jsonpath='{.spec.template.spec.containers[*].image}' | grep -q 'nginx:1.27'"

echo "Score: $pass/$((pass+fail))"
[ $fail -eq 0 ]
