#!/usr/bin/env bash
# Verifier for the Init Containers lab. Usage: verify.sh <namespace>
set -uo pipefail
NS="${1:-default}"
pass=0; fail=0
ck(){ if eval "$2" >/dev/null 2>&1; then echo "PASS: $1"; pass=$((pass+1)); else echo "FAIL: $1"; fail=$((fail+1)); fi; }

ck "Pod 'app-with-init' exists"       "kubectl -n $NS get pod app-with-init"
ck "Pod has an init container 'setup'" "kubectl -n $NS get pod app-with-init -o jsonpath='{.spec.initContainers[*].name}' | grep -qw setup"
ck "Pod main container uses nginx:1.27" "kubectl -n $NS get pod app-with-init -o jsonpath='{.spec.containers[*].image}' | grep -q 'nginx:1.27'"
ck "Pod has emptyDir volume 'work'"   "kubectl -n $NS get pod app-with-init -o jsonpath='{.spec.volumes[*].name}' | grep -qw work"
ck "Pod 'app-with-init' is Running"   "[ \"\$(kubectl -n $NS get pod app-with-init -o jsonpath='{.status.phase}')\" = Running ]"

echo "Score: $pass/$((pass+fail))"
[ $fail -eq 0 ]
