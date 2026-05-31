#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  researchskills-extract.sh <source-file-or-dir> [options]

Options:
  --out <dir>             Output directory for bundle/prompt.
  --domain <slug>         Target ResearchSkills domain.
  --subdomain <slug>      Target ResearchSkills subdomain.
  --contributor <handle>  Public contributor handle.
  --max-bytes <n>         Max bytes copied into source-bundle.md. Default: 200000.
  --validate-dir <dir>    Validate existing generated .md files under this repo path.
  -h, --help              Show this help.

This helper does not call an LLM and does not install commands. It prepares a
bounded source bundle and a high-signal extraction prompt for the agent.
USAGE
}

die() {
  printf 'ERROR: %s\n' "$*" >&2
  exit 1
}

SOURCE=""
OUT_DIR=""
DOMAIN="computer-science"
SUBDOMAIN="artificial-intelligence"
CONTRIBUTOR="${USER:-anonymous}"
MAX_BYTES="200000"
VALIDATE_DIR=""

while [ "$#" -gt 0 ]; do
  case "$1" in
    --out) OUT_DIR="${2:-}"; shift 2 ;;
    --domain) DOMAIN="${2:-}"; shift 2 ;;
    --subdomain) SUBDOMAIN="${2:-}"; shift 2 ;;
    --contributor) CONTRIBUTOR="${2:-}"; shift 2 ;;
    --max-bytes) MAX_BYTES="${2:-}"; shift 2 ;;
    --validate-dir) VALIDATE_DIR="${2:-}"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    --*) die "unknown option: $1" ;;
    *) if [ -z "$SOURCE" ]; then SOURCE="$1"; shift; else die "unexpected argument: $1"; fi ;;
  esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"
VALIDATOR="$REPO_ROOT/utils/tools/validate.py"

if [ -n "$VALIDATE_DIR" ]; then
  [ -f "$VALIDATOR" ] || die "validator not found: $VALIDATOR"
  mapfile -d '' files < <(find "$VALIDATE_DIR" -type f -name '*.md' -print0)
  [ "${#files[@]}" -gt 0 ] || die "no markdown files found under $VALIDATE_DIR"
  python "$VALIDATOR" "${files[@]}"
fi

[ -n "$SOURCE" ] || { usage; exit 2; }
[ -e "$SOURCE" ] || die "source not found: $SOURCE"
case "$MAX_BYTES" in ''|*[!0-9]*) die "--max-bytes must be an integer" ;; esac

if [ -z "$OUT_DIR" ]; then
  stamp="$(date +%Y%m%d-%H%M%S)"
  OUT_DIR="$REPO_ROOT/.researchskills-extract/$stamp"
fi
mkdir -p "$OUT_DIR"

MANIFEST="$OUT_DIR/source-manifest.tsv"
BUNDLE="$OUT_DIR/source-bundle.md"
PROMPT="$OUT_DIR/extraction-prompt.md"

printf 'path\tbytes\n' > "$MANIFEST"
cat > "$BUNDLE" <<EOF
# ResearchSkills Source Bundle

Source: $SOURCE
Generated: $(date -u +%Y-%m-%dT%H:%M:%SZ)
Byte limit: $MAX_BYTES

EOF

is_text_candidate() {
  case "$1" in
    *.md|*.markdown|*.txt|*.json|*.jsonl|*.yaml|*.yml|*.csv|*.tsv|*.log) return 0 ;;
    *) return 1 ;;
  esac
}

append_file() {
  file="$1"
  [ -f "$file" ] || return 0
  is_text_candidate "$file" || return 0
  size="$(wc -c < "$file" | tr -d ' ')"
  current="$(wc -c < "$BUNDLE" | tr -d ' ')"
  if [ $((current + size)) -gt "$MAX_BYTES" ]; then
    printf '%s\t%s\tSKIPPED_LIMIT\n' "$file" "$size" >> "$MANIFEST"
    return 0
  fi
  printf '%s\t%s\n' "$file" "$size" >> "$MANIFEST"
  {
    printf '\n\n## File: %s\n\n' "$file"
    printf '```text\n'
    sed 's/```/` ` `/g' "$file"
    printf '\n```\n'
  } >> "$BUNDLE"
}

if [ -f "$SOURCE" ]; then
  append_file "$SOURCE"
else
  while IFS= read -r -d '' file; do
    append_file "$file"
  done < <(
    find "$SOURCE" \
      \( -name .git -o -name node_modules -o -name .venv -o -name venv -o -name dist -o -name build -o -name __pycache__ -o -name .researchskills-extract \) -prune \
      -o -type f -print0 | sort -z
  )
fi

cat > "$PROMPT" <<EOF
# ResearchSkills Extraction Prompt

Use the ResearchSkills meta skill to extract reusable research know-how from
the source bundle below. Write output files directly under:

\`.agents/skills/<domain>/<subdomain>/<contributor>/<memory_type>/<subtype>--<skill-name>.md\`

Default metadata:

- domain: \`$DOMAIN\`
- subdomain: \`$SUBDOMAIN\`
- contributor: \`$CONTRIBUTOR\`

Quality gate:

1. Extract only research know-how: scientific methodology, domain facts,
   computational science methods, research design, evaluation strategy, or
   concrete scientific episodes.
2. Reject pure engineering, package-manager, git, auth, deployment, UI, or
   generic coding lessons unless they directly constrain the research method.
3. One skill file equals one reusable insight.
4. De-identify private paths, usernames, project names, private URLs, and
   collaborator names. Preserve scientific methods, model names, datasets,
   parameters, and mechanisms.
5. Prefer 0 high-quality skills over broad low-value skills.

Memory types:

- procedural: \`tie\`, \`no-change\`, \`constraint-failure\`, \`operator-fail\`
- semantic: \`frontier\`, \`non-public\`, \`correction\`
- episodic: \`failure\`, \`adaptation\`, \`anomalous\`

Validation:

\`\`\`bash
python utils/tools/validate.py .agents/skills/<domain>/<subdomain>/<contributor>/<memory_type>/<subtype>--<skill-name>.md
\`\`\`

After extraction, summarize:

- files created
- candidates rejected and why
- validation command/result

---

$(cat "$BUNDLE")
EOF

cat <<EOF
ResearchSkills extraction helper complete.

Output directory: $OUT_DIR
Manifest:         $MANIFEST
Source bundle:    $BUNDLE
Prompt:           $PROMPT

Next:
  1. Read $PROMPT.
  2. Create ResearchSkills files under .agents/skills/.
  3. Validate with: python utils/tools/validate.py <generated-skill.md>
EOF
