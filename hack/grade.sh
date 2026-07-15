#!/usr/bin/env bash
# Autograder runner. For each attempted lab (a lab whose submission/ contains YAML),
# create an isolated namespace, apply the learner's manifests, and run the lab's verify.sh.
#
# Usage:
#   hack/grade.sh all                 # grade every attempted lab
#   hack/grade.sh labs/core/01-pods   # grade a single lab
#
# A lab is "attempted" if labs/<group>/<slug>/submission/ contains at least one .yaml/.yml file.
# verify.sh contract: `verify.sh <namespace>` prints PASS:/FAIL: lines and exits 0 iff all pass.
set -uo pipefail

TARGET="${1:-all}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SUMMARY="${GITHUB_STEP_SUMMARY:-/dev/stdout}"

# Collect candidate labs.
labs=()
if [ "$TARGET" != "all" ]; then
  labs+=("$ROOT/$TARGET")
else
  while IFS= read -r d; do labs+=("$(dirname "$d")"); done \
    < <(find "$ROOT/labs" -type d -name submission | sort)
fi

attempted=0; passed=0; failed=0
{
  echo "# Autograding results"
  echo ""
  echo "| Lab | Result | Score |"
  echo "|-----|--------|-------|"
} >> "$SUMMARY"

overall_rc=0
for lab in "${labs[@]}"; do
  sub="$lab/submission"
  verify="$lab/verify.sh"
  # Skip labs with no submitted YAML.
  shopt -s nullglob
  files=("$sub"/*.yaml "$sub"/*.yml)
  shopt -u nullglob
  [ ${#files[@]} -eq 0 ] && continue
  [ -f "$verify" ] || { echo "| ${lab#$ROOT/} | SKIP (no verify.sh) | - |" >> "$SUMMARY"; continue; }

  attempted=$((attempted+1))
  rel="${lab#$ROOT/}"
  ns="$(echo "$rel" | tr '/_' '--' | tr '[:upper:]' '[:lower:]' | cut -c1-60)"

  echo "::group::Grading $rel (namespace: $ns)"
  kubectl create namespace "$ns" >/dev/null 2>&1 || true
  # Set the namespace as the context default (do NOT pass -n): objects without a
  # namespace land here for isolation, while objects that pin their own namespace
  # (e.g. a lab that creates its own namespace) still apply without conflict.
  kubectl config set-context --current --namespace="$ns" >/dev/null 2>&1 || true
  kubectl apply -f "$sub" || true
  # Wait for workloads to reconcile (image pulls, scheduling). Ready-wait covers
  # long-running pods; Jobs/completes are checked by the lab's own verify.sh.
  kubectl -n "$ns" wait --for=condition=Ready pods --all --timeout=120s >/dev/null 2>&1 || true
  sleep 3

  if bash "$verify" "$ns"; then
    result="PASS"; passed=$((passed+1))
  else
    result="FAIL"; failed=$((failed+1)); overall_rc=1
  fi
  score_line="$(bash "$verify" "$ns" 2>/dev/null | grep -E '^Score:' | tail -1)"
  echo "::endgroup::"
  echo "| $rel | $result | ${score_line#Score: } |" >> "$SUMMARY"
done

{
  echo ""
  echo "**Attempted:** $attempted  |  **Passed:** $passed  |  **Failed:** $failed"
} >> "$SUMMARY"

if [ "$attempted" -eq 0 ]; then
  echo "No attempted labs found (no submission/ contains YAML). Nothing to grade."
fi
exit $overall_rc
