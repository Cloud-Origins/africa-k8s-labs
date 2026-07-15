#!/usr/bin/env bash
# Verifier for the Health Probes lab. Usage: verify.sh <namespace>
set -uo pipefail
NS="${1:-default}"
pass=0; fail=0
ck(){ if eval "$2" >/dev/null 2>&1; then echo "PASS: $1"; pass=$((pass+1)); else echo "FAIL: $1"; fail=$((fail+1)); fi; }

ck "Deployment 'web' exists"          "kubectl -n $NS get deploy web"
ck "Deployment 'web' has 2 ready"     "[ \"\$(kubectl -n $NS get deploy web -o jsonpath='{.status.readyReplicas}')\" = 2 ]"
ck "Container has a livenessProbe"    "kubectl -n $NS get deploy web -o jsonpath='{.spec.template.spec.containers[*].livenessProbe.httpGet.port}' | grep -qw 80"
ck "Container has a readinessProbe"   "kubectl -n $NS get deploy web -o jsonpath='{.spec.template.spec.containers[*].readinessProbe.httpGet.port}' | grep -qw 80"

echo "Score: $pass/$((pass+fail))"
[ $fail -eq 0 ]
