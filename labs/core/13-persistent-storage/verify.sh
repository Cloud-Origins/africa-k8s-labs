#!/usr/bin/env bash
# Verifier for the Persistent Storage lab. Usage: verify.sh <namespace>
set -uo pipefail
NS="${1:-default}"
pass=0; fail=0
ck(){ if eval "$2" >/dev/null 2>&1; then echo "PASS: $1"; pass=$((pass+1)); else echo "FAIL: $1"; fail=$((fail+1)); fi; }

# Bind is WaitForFirstConsumer on kind; the pod must be scheduled first.
kubectl -n "$NS" wait --for=jsonpath='{.status.phase}'=Bound pvc/data-pvc --timeout=90s >/dev/null 2>&1 || true

ck "PVC 'data-pvc' exists"            "kubectl -n $NS get pvc data-pvc"
ck "PVC requests 1Gi"                 "kubectl -n $NS get pvc data-pvc -o jsonpath='{.spec.resources.requests.storage}' | grep -q '1Gi'"
ck "PVC access mode RWO"             "kubectl -n $NS get pvc data-pvc -o jsonpath='{.spec.accessModes[*]}' | grep -qw ReadWriteOnce"
ck "PVC is Bound"                     "[ \"\$(kubectl -n $NS get pvc data-pvc -o jsonpath='{.status.phase}')\" = Bound ]"
ck "Pod 'writer' exists"              "kubectl -n $NS get pod writer"
ck "Pod 'writer' mounts at /data"     "kubectl -n $NS get pod writer -o jsonpath='{.spec.containers[*].volumeMounts[*].mountPath}' | grep -q '/data'"

echo "Score: $pass/$((pass+fail))"
[ $fail -eq 0 ]
