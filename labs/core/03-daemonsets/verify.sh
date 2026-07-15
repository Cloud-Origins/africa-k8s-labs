#!/usr/bin/env bash
# Verifier for the DaemonSets lab. Usage: verify.sh <namespace>
set -uo pipefail
NS="${1:-default}"
pass=0; fail=0
ck(){ if eval "$2" >/dev/null 2>&1; then echo "PASS: $1"; pass=$((pass+1)); else echo "FAIL: $1"; fail=$((fail+1)); fi; }

ck "DaemonSet 'node-logger' exists"   "kubectl -n $NS get ds node-logger"
ck "DaemonSet uses busybox:1.36"      "kubectl -n $NS get ds node-logger -o jsonpath='{.spec.template.spec.containers[*].image}' | grep -q 'busybox:1.36'"
ck "DaemonSet desired >= 1"           "[ \"\$(kubectl -n $NS get ds node-logger -o jsonpath='{.status.desiredNumberScheduled}')\" -ge 1 ]"
ck "DaemonSet ready == desired"       "[ \"\$(kubectl -n $NS get ds node-logger -o jsonpath='{.status.numberReady}')\" = \"\$(kubectl -n $NS get ds node-logger -o jsonpath='{.status.desiredNumberScheduled}')\" ]"

echo "Score: $pass/$((pass+fail))"
[ $fail -eq 0 ]
