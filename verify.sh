#!/usr/bin/env bash
# verify.sh — runs the project's verification checks.
# Exits 0 if all checks pass, non-zero otherwise.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

failures=0

note() { printf '  [check] %s\n' "$1"; }
pass() { printf '    PASS: %s\n' "$1"; }
fail() { printf '    FAIL: %s\n' "$1"; failures=$((failures + 1)); }

run_check() {
  local name="$1"; shift
  note "$name"
  if "$@" >/tmp/kilo-verify-out.txt 2>&1; then
    pass "$name"
  else
    fail "$name"
    cat /tmp/kilo-verify-out.txt
  fi
}

echo "== Ollama beginner guide — verification =="
echo

# 1. Expected files exist
run_check "Required files exist" bash -c '
  for f in LICENSE README.md STATUS.md index.html manual.html cheat-sheet.html site.css \
           docs/ollama-getting-started.md docs/cheat-sheet.md verify.sh; do
    [ -f "$f" ] || { echo "missing: $f"; exit 1; }
  done
  echo "all required files present"
'

# 2. LICENSE exact copyright line
run_check "LICENSE copyright line exact" bash -c '
  grep -qx "Copyright (c) 2026 Asdale Dynamics, LLC" LICENSE
  echo "exact copyright line present"
'

# 3. README credits Asdale Dynamics, LLC
run_check "README credits Asdale Dynamics, LLC" bash -c '
  grep -q "Asdale Dynamics, LLC" README.md
  echo "README credits present"
'

# 4. HTML files parse
for html in index.html manual.html cheat-sheet.html; do
  run_check "$html parses" python3 -c "
import html.parser
html.parser.HTMLParser().feed(open('$html', encoding='utf-8').read())
print('$html parsed OK')
"
done

# 5. Internal links resolve
run_check "Internal links resolve" python3 - <<'PY'
import html.parser, os, sys
root = os.getcwd()
class L(html.parser.HTMLParser):
    def __init__(self):
        super().__init__(); self.links = []
    def handle_starttag(self, tag, attrs):
        if tag in ("a", "link"):
            for k, v in attrs:
                if k == "href": self.links.append(v)
broken = []
for f in ["index.html", "manual.html", "cheat-sheet.html"]:
    p = L(); p.feed(open(f, encoding="utf-8").read())
    for href in p.links:
        if href.startswith(("http://", "https://", "mailto:", "#")):
            continue
        target = os.path.join(root, href.split("#")[0])
        if not os.path.exists(target):
            broken.append((f, href))
if broken:
    for f, href in broken:
        print(f"BROKEN {f}: {href}")
    sys.exit(1)
print("all internal links resolve")
PY

# 6. No .github/workflows
run_check "No .github/workflows" bash -c '
  [ ! -d .github/workflows ] || { echo "workflows dir present"; exit 1; }
  echo "no .github/workflows"
'

# 7. No obvious secrets / API keys in text files
run_check "No secrets or API keys" bash -c '
  if grep -RInE "sk-|API[_-]?KEY|password\s*=|secret\s*=" \
      LICENSE README.md STATUS.md index.html manual.html cheat-sheet.html site.css \
      docs/ollama-getting-started.md docs/cheat-sheet.md 2>/dev/null; then
    echo "possible secret found"; exit 1
  fi
  echo "no secrets detected"
'

# 8. Cheat sheet has print media rule
run_check "Cheat sheet has print styles" bash -c '
  grep -q "@media print" cheat-sheet.html
  echo "print styles present"
'

echo
if [ "$failures" -eq 0 ]; then
  echo "ALL CHECKS PASSED"
  exit 0
else
  echo "$failures check(s) failed"
  exit 1
fi
