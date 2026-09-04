#!/usr/bin/env bash
# Estate secret + PII guard. Fails if a crown-jewel secret or a customer serial is committed.
# Usage: secret-scan.sh [--staged]   (--staged = only staged files, for the pre-commit hook)
# Canonical copy lives in spidey-meta; see GUARDRAIL.md.
#
# Design: exact secrets are matched by SHA-256 HASH so this script embeds NO secret value (an
# earlier literal-pattern version leaked the very keys it guarded). Structural markers (age/PEM
# key headers, factory-serial FORMAT) stay as plain regex because they are not themselves secret.
# The BLE XOR/codec key is intentionally public (shipped in spidey-ha) and is NOT listed.
set -u
mode="${1:-all}"

key_markers='AGE-SECRET-KEY-1|-----BEGIN [A-Z ]*PRIVATE KEY-----'
serial='FEP[0-9]{3}-[0-9]{2}-[0-9]{4}'
serial_placeholder='FEP000-00-0000'

# SHA-256 of exact secret tokens (values live only in sops-encrypted files; only hashes appear here).
bad_hashes="
  a57cd170c5dbe5f3b52c3698adeccf5e0ef1b7b588d5a9b374efe680982c3418
  58063e3f8023f38f8dac47c7f5e678091b763bfc5c3c3fb80a6432c2b3492cf8
  66495c19bff156347d36cddc774ed7b95927a6eee553c3a00416157fb2c8dd65
  d778021222c11d3429a0bf73b477a99dbc7d9e25485850f261825d8372a8c74d
"

if [ "$mode" = "--staged" ]; then
  files=$(git diff --cached --name-only --diff-filter=ACM)
else
  files=$(git ls-files)
fi
[ -z "$files" ] && exit 0

hits=0
while IFS= read -r f; do
  [ -f "$f" ] || continue
  case "$f" in
    *.png|*.jpg|*.jpeg|*.mp3|*.zip|*.img|*.apk|*.aab|*.pdf|*.gif|*.so|*.o|*.a) continue;;
    templates/*|*/secret-scan.sh|secret-scan.sh) continue;;
  esac
  if LC_ALL=C grep -InE "$key_markers" "$f" >/dev/null 2>&1; then
    echo "SECRET (key header) match in $f:"
    LC_ALL=C grep -InE "$key_markers" "$f" | sed 's/^/    /' | head -5
    hits=1
  fi
  if LC_ALL=C grep -InE "$serial" "$f" 2>/dev/null | grep -vE "$serial_placeholder" | grep -q .; then
    echo "PII (customer serial) match in $f:"
    LC_ALL=C grep -InE "$serial" "$f" | grep -vE "$serial_placeholder" | sed 's/^/    /' | head -5
    hits=1
  fi
  # exact secrets by hash: mixed alnum/hex tokens only (letters+digits), so prose is skipped
  while IFS= read -r tok; do
    [ -z "$tok" ] && continue
    h=$(printf '%s' "$tok" | sha256sum | cut -d' ' -f1)
    case "$bad_hashes" in
      *"$h"*) echo "SECRET match (hash) in $f (token redacted)"; hits=1;;
    esac
  done <<TOKS
$(LC_ALL=C grep -oE '[A-Za-z0-9]{9,}' "$f" 2>/dev/null | grep -E '[0-9]' | grep -iE '[a-z]' | sort -u)
TOKS
done <<EOF
$files
EOF

if [ "$hits" = "1" ]; then
  echo ""
  echo "Blocked: a crown-jewel secret or customer serial is present. Move it to a sops-encrypted"
  echo "path (see GUARDRAIL.md). Emergency override: git commit --no-verify."
  exit 1
fi
exit 0
