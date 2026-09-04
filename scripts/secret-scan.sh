#!/usr/bin/env bash
# Estate secret + PII guard. Fails if a crown-jewel secret or the customer serial is committed.
# Usage: scripts/secret-scan.sh [--staged]   (--staged = only staged files, for the pre-commit hook)
# Canonical copy lives in spidey-meta/templates/. See spidey-meta/GUARDRAIL.md.
set -u
mode="${1:-all}"
# Patterns that must NEVER be committed to ANY repo (they live only in gitignored/age-encrypted files).
# NOTE: the BLE XOR/codec key is intentionally public (shipped in spidey-ha) and is NOT listed here.
patterns='***REMOVED***|***REMOVED***|AGE-SECRET-KEY-1|-----BEGIN [A-Z ]*PRIVATE KEY-----|***REMOVED***|***REMOVED***|FEP000'
if [ "$mode" = "--staged" ]; then
  files=$(git diff --cached --name-only --diff-filter=ACM)
else
  files=$(git ls-files)
fi
[ -z "$files" ] && exit 0
hits=0
while IFS= read -r f; do
  [ -f "$f" ] || continue
  # skip binaries, the scanner itself (it holds the patterns as literals), the meta templates, and GUARDRAIL
  case "$f" in
    *.png|*.jpg|*.jpeg|*.mp3|*.zip|*.img|*.apk|*.aab|*.pdf|*.gif|*.so|*.o|*.a) continue;;
    */secret-scan.sh|secret-scan.sh|templates/*|*/GUARDRAIL.md|GUARDRAIL.md) continue;;
  esac
  if LC_ALL=C grep -InE "$patterns" "$f" >/dev/null 2>&1; then
    echo "SECRET/PII match in $f:"
    LC_ALL=C grep -InE "$patterns" "$f" | sed 's/^/    /' | head -5
    hits=1
  fi
done <<EOF
$files
EOF
if [ "$hits" = "1" ]; then
  echo ""
  echo "Blocked: a crown-jewel secret or customer serial is present. Move it to a gitignored/age-encrypted"
  echo "path (see spidey-meta/GUARDRAIL.md). To override in a genuine emergency: git commit --no-verify."
  exit 1
fi
exit 0
