#!/usr/bin/env bash
# Verifier for the StatefulSets lab. Usage: verify.sh <namespace>
set -uo pipefail
NS="${1:-default}"
pass=0; fail=0
ck(){ if eval "$2" >/dev/null 2>&1; then echo "PASS: $1"; pass=$((pass+1)); else echo "FAIL: $1"; fail=$((fail+1)); fi; }

# StatefulSet pods start sequentially and bind PVCs; wait for the rollout.
kubectl -n "$NS" rollout status statefulset/data --timeout=150s >/dev/null 2>&1 || true

ck "Headless Service 'data' exists"   "kubectl -n $NS get svc data"
ck "Service 'data' is headless (clusterIP None)" "[ \"\$(kubectl -n $NS get svc data -o jsonpath='{.spec.clusterIP}')\" = None ]"
ck "StatefulSet 'data' exists"        "kubectl -n $NS get sts data"
ck "StatefulSet serviceName is data"  "[ \"\$(kubectl -n $NS get sts data -o jsonpath='{.spec.serviceName}')\" = data ]"
ck "StatefulSet desires 2 replicas"   "[ \"\$(kubectl -n $NS get sts data -o jsonpath='{.spec.replicas}')\" = 2 ]"
ck "StatefulSet has 2 ready"          "[ \"\$(kubectl -n $NS get sts data -o jsonpath='{.status.readyReplicas}')\" = 2 ]"
ck "StatefulSet has volumeClaimTemplate" "kubectl -n $NS get sts data -o jsonpath='{.spec.volumeClaimTemplates[*].metadata.name}' | grep -q ."

echo "Score: $pass/$((pass+fail))"
[ $fail -eq 0 ]
