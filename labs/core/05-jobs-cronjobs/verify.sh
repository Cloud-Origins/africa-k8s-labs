#!/usr/bin/env bash
# Verifier for the Jobs & CronJobs lab. Usage: verify.sh <namespace>
set -uo pipefail
NS="${1:-default}"
pass=0; fail=0
ck(){ if eval "$2" >/dev/null 2>&1; then echo "PASS: $1"; pass=$((pass+1)); else echo "FAIL: $1"; fail=$((fail+1)); fi; }

# Give the Job a chance to complete.
kubectl -n "$NS" wait --for=condition=complete job/counter --timeout=90s >/dev/null 2>&1 || true

ck "Job 'counter' exists"             "kubectl -n $NS get job counter"
ck "Job 'counter' succeeded"          "[ \"\$(kubectl -n $NS get job counter -o jsonpath='{.status.succeeded}')\" -ge 1 ]"
ck "CronJob 'hello' exists"           "kubectl -n $NS get cronjob hello"
ck "CronJob schedule is */5 * * * *"  "[ \"\$(kubectl -n $NS get cronjob hello -o jsonpath='{.spec.schedule}')\" = '*/5 * * * *' ]"

echo "Score: $pass/$((pass+fail))"
[ $fail -eq 0 ]
