#!/usr/bin/env bash
# Verifier for the Namespaces & ResourceQuotas lab. Usage: verify.sh <namespace>
# Note: this lab creates its own namespace 'team-a'; the passed namespace is ignored.
set -uo pipefail
pass=0; fail=0
ck(){ if eval "$2" >/dev/null 2>&1; then echo "PASS: $1"; pass=$((pass+1)); else echo "FAIL: $1"; fail=$((fail+1)); fi; }

ck "Namespace 'team-a' exists"        "kubectl get namespace team-a"
ck "ResourceQuota 'compute' in team-a" "kubectl -n team-a get resourcequota compute"
ck "Quota sets requests.cpu"          "kubectl -n team-a get resourcequota compute -o jsonpath='{.spec.hard.requests\.cpu}' | grep -q ."
ck "Quota sets requests.memory"       "kubectl -n team-a get resourcequota compute -o jsonpath='{.spec.hard.requests\.memory}' | grep -q ."
ck "Quota sets limits.cpu"            "kubectl -n team-a get resourcequota compute -o jsonpath='{.spec.hard.limits\.cpu}' | grep -q ."
ck "Quota sets limits.memory"         "kubectl -n team-a get resourcequota compute -o jsonpath='{.spec.hard.limits\.memory}' | grep -q ."

echo "Score: $pass/$((pass+fail))"
[ $fail -eq 0 ]
