#!/usr/bin/env bash
# Verifier for the NetworkPolicy lab (object-level; enforcement not tested on kindnet). Usage: verify.sh <namespace>
set -uo pipefail
NS="${1:-default}"
pass=0; fail=0
ck(){ if eval "$2" >/dev/null 2>&1; then echo "PASS: $1"; pass=$((pass+1)); else echo "FAIL: $1"; fail=$((fail+1)); fi; }

ck "NetworkPolicy 'default-deny-ingress' exists" "kubectl -n $NS get networkpolicy default-deny-ingress"
ck "default-deny has policyType Ingress" "kubectl -n $NS get networkpolicy default-deny-ingress -o jsonpath='{.spec.policyTypes[*]}' | grep -qw Ingress"
ck "NetworkPolicy 'allow-web' exists"    "kubectl -n $NS get networkpolicy allow-web"
ck "allow-web targets app=web"           "[ \"\$(kubectl -n $NS get networkpolicy allow-web -o jsonpath='{.spec.podSelector.matchLabels.app}')\" = web ]"
ck "allow-web permits port 80"           "kubectl -n $NS get networkpolicy allow-web -o jsonpath='{.spec.ingress[*].ports[*].port}' | grep -qw 80"

echo "Score: $pass/$((pass+fail))"
[ $fail -eq 0 ]
