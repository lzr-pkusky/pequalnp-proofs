#!/usr/bin/env bash
set -euo pipefail
step=${1:?step id}
[[ $step =~ ^L-meta-[0-9]+$ ]]
root=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "$root/../proof-workspace"
stem=${step//-/_}
file="lean/PEqualNP/Outside/$stem.lean"
[[ ! -e "$file" ]]
trap 'rm -f "$file"' EXIT
cp "$root/candidates/$stem.lean" "$file"
node --input-type=module - "$file" "PEqualNP.Outside.$stem" <<'JS'
import fs from 'node:fs';
import {checkProofFile} from './.github/scripts/outside-guard.mjs';
checkProofFile(fs.readFileSync(process.argv[2]), ['PEqualNP.Defs'], process.argv[3]);
JS
export PATH="$PWD/../lean-4.36.0-darwin_aarch64/bin:$PATH"
export PEQUALNP_REAL_LAKE="$PWD/../lean-4.36.0-darwin_aarch64/bin/lake"
export PEQUALNP_HOME="$PWD/../pnp-check-cache"
log="$root/check-$step.log"
if node tools/check-lean.mjs "$file" "$root/candidates/$step.txt" check > "$log" 2>&1; then
  rg '^ACCEPTED' "$log" | cut -c1-190
else
  tail -15 "$log" | cut -c1-200
  exit 1
fi
