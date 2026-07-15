#!/usr/bin/env bash
# Verifier for the Deployments lab. Usage: verify.sh <namespace>
set -uo pipefail
NS="${1:-default}"
pass=0; fail=0
ck(){ if eval "$2" >/dev/null 2>&1; then echo "PASS: $1"; pass=$((pass+1)); else echo "FAIL: $1"; fail=$((fail+1)); fi; }

ck "Deployment 'web' exists"          "kubectl -n $NS get deploy web"
ck "Deployment 'web' desires 3 replicas" "[ \"\$(kubectl -n $NS get deploy web -o jsonpath='{.spec.replicas}')\" = 3 ]"
ck "Deployment 'web' has 3 ready"     "[ \"\$(kubectl -n $NS get deploy web -o jsonpath='{.status.readyReplicas}')\" = 3 ]"
ck "Deployment 'web' uses nginx:1.27" "kubectl -n $NS get deploy web -o jsonpath='{.spec.template.spec.containers[*].image}' | grep -q 'nginx:1.27'"
ck "Deployment selector is app=web"   "[ \"\$(kubectl -n $NS get deploy web -o jsonpath='{.spec.selector.matchLabels.app}')\" = web ]"

echo "Score: $pass/$((pass+fail))"
[ $fail -eq 0 ]
