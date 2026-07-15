#!/usr/bin/env bash
# Verifier for the Services lab. Usage: verify.sh <namespace>
set -uo pipefail
NS="${1:-default}"
pass=0; fail=0
ck(){ if eval "$2" >/dev/null 2>&1; then echo "PASS: $1"; pass=$((pass+1)); else echo "FAIL: $1"; fail=$((fail+1)); fi; }

ck "Service 'web-svc' exists"         "kubectl -n $NS get svc web-svc"
ck "Service type is ClusterIP"        "[ \"\$(kubectl -n $NS get svc web-svc -o jsonpath='{.spec.type}')\" = ClusterIP ]"
ck "Service selector is app=web"      "[ \"\$(kubectl -n $NS get svc web-svc -o jsonpath='{.spec.selector.app}')\" = web ]"
ck "Service port is 80"               "kubectl -n $NS get svc web-svc -o jsonpath='{.spec.ports[*].port}' | grep -qw 80"
ck "Service has ready endpoints"      "kubectl -n $NS get endpoints web-svc -o jsonpath='{.subsets[*].addresses[*].ip}' | grep -q ."

echo "Score: $pass/$((pass+fail))"
[ $fail -eq 0 ]
