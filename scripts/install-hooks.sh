#!/usr/bin/env bash
# Install the local pre-commit secret guard. Run once per clone.
set -e
root=$(git rev-parse --show-toplevel)
hook="$root/.git/hooks/pre-commit"
printf '#!/usr/bin/env bash\nexec "%s/scripts/secret-scan.sh" --staged\n' "$root" > "$hook"
chmod +x "$hook"
echo "installed pre-commit secret guard -> $hook"
