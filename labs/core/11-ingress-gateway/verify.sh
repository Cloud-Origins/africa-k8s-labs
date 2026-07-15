#!/usr/bin/env bash
# Verifier for the Ingress lab (object-level; no controller required). Usage: verify.sh <namespace>
set -uo pipefail
NS="${1:-default}"
pass=0; fail=0
ck(){ if eval "$2" >/dev/null 2>&1; then echo "PASS: $1"; pass=$((pass+1)); else echo "FAIL: $1"; fail=$((fail+1)); fi; }

ck "Service 'web-svc' exists"         "kubectl -n $NS get svc web-svc"
ck "Ingress 'web-ing' exists"         "kubectl -n $NS get ingress web-ing"
ck "Ingress host is demo.local"       "kubectl -n $NS get ingress web-ing -o jsonpath='{.spec.rules[*].host}' | grep -qw demo.local"
ck "Ingress backend is web-svc"       "kubectl -n $NS get ingress web-ing -o jsonpath='{.spec.rules[*].http.paths[*].backend.service.name}' | grep -qw web-svc"
ck "Ingress backend port is 80"       "kubectl -n $NS get ingress web-ing -o jsonpath='{.spec.rules[*].http.paths[*].backend.service.port.number}' | grep -qw 80"

echo "Score: $pass/$((pass+fail))"
[ $fail -eq 0 ]
