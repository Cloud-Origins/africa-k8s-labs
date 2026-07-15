#!/usr/bin/env bash
# Verifier for the Pods lab. Usage: verify.sh <namespace>
# Prints PASS:/FAIL: lines and a Score:; exits 0 iff all checks pass.
set -uo pipefail
NS="${1:-default}"
pass=0; fail=0
ck(){ if eval "$2" >/dev/null 2>&1; then echo "PASS: $1"; pass=$((pass+1)); else echo "FAIL: $1"; fail=$((fail+1)); fi; }

ck "Pod 'web' exists"                 "kubectl -n $NS get pod web"
ck "Pod 'web' is Running"             "[ \"\$(kubectl -n $NS get pod web -o jsonpath='{.status.phase}')\" = Running ]"
ck "Pod 'web' uses image nginx:1.27"  "kubectl -n $NS get pod web -o jsonpath='{.spec.containers[*].image}' | grep -q 'nginx:1.27'"
ck "Pod 'web' has label app=web"      "[ \"\$(kubectl -n $NS get pod web -o jsonpath='{.metadata.labels.app}')\" = web ]"
ck "Pod 'web' exposes port 80"        "kubectl -n $NS get pod web -o jsonpath='{.spec.containers[*].ports[*].containerPort}' | grep -qw 80"

ck "Pod 'sidecar-demo' exists"        "kubectl -n $NS get pod sidecar-demo"
ck "'sidecar-demo' has containers app+logger" "[ \$(kubectl -n $NS get pod sidecar-demo -o jsonpath='{.spec.containers[*].name}' | tr ' ' '\n' | grep -cE '^(app|logger)\$') -eq 2 ]"
ck "'sidecar-demo' has emptyDir volume 'logs'" "kubectl -n $NS get pod sidecar-demo -o jsonpath='{.spec.volumes[*].name}' | grep -qw logs"
ck "'sidecar-demo' mounts logs at /var/log/shared" "kubectl -n $NS get pod sidecar-demo -o jsonpath='{.spec.containers[*].volumeMounts[*].mountPath}' | grep -q '/var/log/shared'"

echo "Score: $pass/$((pass+fail))"
[ $fail -eq 0 ]
