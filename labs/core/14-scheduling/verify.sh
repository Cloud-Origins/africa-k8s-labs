#!/usr/bin/env bash
# Verifier for the Scheduling lab. Usage: verify.sh <namespace>
set -uo pipefail
NS="${1:-default}"
pass=0; fail=0
ck(){ if eval "$2" >/dev/null 2>&1; then echo "PASS: $1"; pass=$((pass+1)); else echo "FAIL: $1"; fail=$((fail+1)); fi; }

ck "Pod 'pinned' exists"              "kubectl -n $NS get pod pinned"
ck "Pod has node affinity"            "kubectl -n $NS get pod pinned -o jsonpath='{.spec.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*].matchExpressions[*].key}' | grep -q 'kubernetes.io/os'"
ck "Pod tolerates key 'dedicated'"    "kubectl -n $NS get pod pinned -o jsonpath='{.spec.tolerations[*].key}' | grep -qw dedicated"
ck "Toleration value is 'labs'"       "kubectl -n $NS get pod pinned -o jsonpath='{.spec.tolerations[*].value}' | grep -qw labs"
ck "Pod 'pinned' is Running"          "[ \"\$(kubectl -n $NS get pod pinned -o jsonpath='{.status.phase}')\" = Running ]"

echo "Score: $pass/$((pass+fail))"
[ $fail -eq 0 ]
