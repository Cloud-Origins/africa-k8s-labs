#!/usr/bin/env bash
# Verifier for the RBAC lab. Usage: verify.sh <namespace>
set -uo pipefail
NS="${1:-default}"
pass=0; fail=0
ck(){ if eval "$2" >/dev/null 2>&1; then echo "PASS: $1"; pass=$((pass+1)); else echo "FAIL: $1"; fail=$((fail+1)); fi; }

ck "ServiceAccount 'deployer' exists" "kubectl -n $NS get sa deployer"
ck "Role 'pod-reader' exists"         "kubectl -n $NS get role pod-reader"
ck "Role allows get/list on pods"     "kubectl -n $NS get role pod-reader -o jsonpath='{.rules[*].verbs[*]}' | grep -q list && kubectl -n $NS get role pod-reader -o jsonpath='{.rules[*].resources[*]}' | grep -qw pods"
ck "RoleBinding 'deployer-can-read' exists" "kubectl -n $NS get rolebinding deployer-can-read"
ck "deployer CAN list pods"           "[ \"\$(kubectl auth can-i list pods --as=system:serviceaccount:$NS:deployer -n $NS)\" = yes ]"
ck "deployer CANNOT delete pods"      "[ \"\$(kubectl auth can-i delete pods --as=system:serviceaccount:$NS:deployer -n $NS)\" = no ]"

echo "Score: $pass/$((pass+fail))"
[ $fail -eq 0 ]
