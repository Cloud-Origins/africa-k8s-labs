#!/usr/bin/env bash
# Verifier for the ConfigMaps & Secrets lab. Usage: verify.sh <namespace>
set -uo pipefail
NS="${1:-default}"
pass=0; fail=0
ck(){ if eval "$2" >/dev/null 2>&1; then echo "PASS: $1"; pass=$((pass+1)); else echo "FAIL: $1"; fail=$((fail+1)); fi; }

ck "ConfigMap 'app-config' exists"    "kubectl -n $NS get configmap app-config"
ck "ConfigMap APP_MODE=production"    "[ \"\$(kubectl -n $NS get configmap app-config -o jsonpath='{.data.APP_MODE}')\" = production ]"
ck "Secret 'app-secret' exists"       "kubectl -n $NS get secret app-secret"
ck "Secret has key API_KEY"           "kubectl -n $NS get secret app-secret -o jsonpath='{.data.API_KEY}' | grep -q ."
ck "Pod 'configured' exists"          "kubectl -n $NS get pod configured"
ck "Pod env includes APP_MODE"        "kubectl -n $NS get pod configured -o jsonpath='{.spec.containers[*].env[*].name}' | grep -qw APP_MODE"
ck "Pod env includes API_KEY"         "kubectl -n $NS get pod configured -o jsonpath='{.spec.containers[*].env[*].name}' | grep -qw API_KEY"

echo "Score: $pass/$((pass+fail))"
[ $fail -eq 0 ]
