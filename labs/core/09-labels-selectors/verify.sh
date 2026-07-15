#!/usr/bin/env bash
# Verifier for the Labels & Selectors lab. Usage: verify.sh <namespace>
set -uo pipefail
NS="${1:-default}"
pass=0; fail=0
ck(){ if eval "$2" >/dev/null 2>&1; then echo "PASS: $1"; pass=$((pass+1)); else echo "FAIL: $1"; fail=$((fail+1)); fi; }

ck "Pod 'shop-prod' exists"           "kubectl -n $NS get pod shop-prod"
ck "Pod 'shop-dev' exists"            "kubectl -n $NS get pod shop-dev"
ck "Pod 'api-prod' exists"            "kubectl -n $NS get pod api-prod"
ck "selector env=prod returns 2 pods" "[ \$(kubectl -n $NS get pods -l env=prod --no-headers 2>/dev/null | wc -l) -eq 2 ]"
ck "selector app=shop returns 2 pods" "[ \$(kubectl -n $NS get pods -l app=shop --no-headers 2>/dev/null | wc -l) -eq 2 ]"
ck "selector app=shop,env=prod is 1"  "[ \$(kubectl -n $NS get pods -l app=shop,env=prod --no-headers 2>/dev/null | wc -l) -eq 1 ]"

echo "Score: $pass/$((pass+fail))"
[ $fail -eq 0 ]
