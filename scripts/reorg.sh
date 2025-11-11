#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Toggle dry-run: set to "1" to only echo actions, "0" to execute
DRY_RUN="${DRY_RUN:-0}"

run() {
  if [[ "${DRY_RUN}" == "1" ]]; then
    echo "[dry-run] $*"
  else
    eval "$@"
  fi
}

say() { echo "==> $*"; }

ensure_dirs() {
  run "mkdir -p analysis finance network datasets datasets/docs prompts notes"
}

# Safe move with git mv; quotes handled by passing as single-quoted args
move_if_exists() {
  local src="$1"
  local dst="$2"
  if [[ -e "$src" ]]; then
    local dstdir
    dstdir="$(dirname "$dst")"
    run "mkdir -p \"$dstdir\""
    run "git mv \"$src\" \"$dst\""
    echo "moved: '$src' -> '$dst'"
  else
    echo "skip (missing): '$src'"
  fi
}

# Safe remove using git rm
remove_if_exists() {
  local tgt="$1"
  if [[ -e "$tgt" ]]; then
    run "git rm \"$tgt\""
    echo "deleted: '$tgt'"
  else
    echo "skip (missing): '$tgt'"
  fi
}

say "Creating folder structure"
ensure_dirs

say "Moving ANALYSIS files"
move_if_exists "Cyberlete 2026 Opportunity Roadmap.md" "analysis/roadmap-2026.md"
move_if_exists "Cyberlete Financing Materials and cyberlete_2026_opportunity_roadmap.md" "analysis/roadmap-2026-alt.md"
move_if_exists "cyberlete_executive_summary.md" "analysis/executive-summary.md"
move_if_exists "cyberlete_updated_executive_summary.md" "analysis/executive-summary-updated.md"
move_if_exists "cyberlete_updated_full_analysis.md" "analysis/full-analysis-updated.md"
move_if_exists "cyberlete_founders_deep_dive.md" "analysis/founders-deep-dive.md"
move_if_exists "cyberlete_network_analysis_report.md" "analysis/network-analysis-report.md"
move_if_exists "cyberlete_multi_actor_attention_analysis.md" "analysis/multi-actor-attention-analysis.md"

say "Moving PROMPTS"
move_if_exists "cyberlete_analysis_prompt_templates.md" "prompts/analysis-prompt-templates.md"
# Remove duplicate .txt if present
remove_if_exists "cyberlete_analysis_prompt_templates.md.txt"

say "Moving DATASETS (docs)"
move_if_exists "Cyberlete Sales Nav LinkedIn Reactions Dataset.md" "datasets/docs/sales-nav-linkedin-reactions-dataset.md"
move_if_exists "Cyberlete_Sales_Nav_LinkedIn_Reactions_Dataset_v1.1.md" "datasets/docs/sales-nav-linkedin-reactions-dataset-v1.1.md"
move_if_exists "cyberlete_dataset_context_and_objectives.md" "datasets/docs/context-and-objectives.md"
move_if_exists "cyberlete_column_glossary.md" "datasets/docs/column-glossary.md"

say "Moving CSV / JSON DATA"
# Keep one canonical copy; delete duplicates later
move_if_exists "cyberlete_active_games_linkedin_pages.csv" "datasets/active-games-linkedin-pages.csv"
# If a second duplicate exists in root (same name), remove it
# (This line safely no-ops if only one exists)
remove_if_exists "cyberlete_active_games_linkedin_pages.csv"

move_if_exists "Cyberlete_lead_list_sales_nav_nov_2025.csv" "datasets/lead-list-sales-nav-2025-11.csv"
move_if_exists "cyberlete_priority_contacts.csv" "datasets/priority-contacts.csv"
move_if_exists "cyberlete_sales_nav_list_linkedin_reactions_result.csv" "datasets/sales-nav-linkedin-reactions-result.csv"

# Normalize spaced name -> ISO date
move_if_exists "cyberlete list reactions BK nov 7 2025.json" "datasets/list-reactions-2025-11-07.json"

# Convert .txt JSONs to .json
move_if_exists "companies cyberlete json.txt" "datasets/companies.json"
move_if_exists "pbtest_json_webhook.txt" "datasets/pbtest-webhook.json"
move_if_exists "webhook pb resultObject json.txt" "datasets/webhook-result-object.json"

say "Moving NETWORK"
move_if_exists "cyberlete_stakeholder_map.md" "network/stakeholder-map.md"

say "Moving FINANCE"
move_if_exists "Cyberlete_Financing_Summary_2025.md" "finance/financing-summary-2025.md"

# Handle README with special dash character or variants
if [[ -e "README – Cyberlete Financing Materials.md" ]]; then
  move_if_exists "README – Cyberlete Financing Materials.md" "finance/README.md"
else
  # Try a fallback glob if the dash differs
  cand="$(ls -1 | grep -i '^README.*Cyberlete.*Financing.*Materials\.md$' || true)"
  if [[ -n "${cand:-}" ]]; then
    move_if_exists "$cand" "finance/README.md"
  else
    echo "skip (missing): financing README with special dash"
  fi
fi

say "Moving NOTES"
# Convert dated notes to ISO
move_if_exists "Bk Nov 7 call notes and firefly summary.txt" "notes/2025-11-07-call-notes-firefly-summary.md"
move_if_exists "cyberlete_meeting_prep_guide.txt" "notes/meeting-prep-guide.md"

say "Ensuring root README.md exists"
if [[ ! -e "README.md" ]]; then
  run "cat > README.md <<'EOF'
# Cyberlete Analysis Archive

Public subset of research, strategy notes, and datasets for the Cyberlete project (2024–2026).

## Structure
- \`analysis/\` — Roadmaps, executive summaries, deep dives
- \`finance/\` — Funding summaries, materials
- \`network/\` — Stakeholder maps
- \`datasets/\` — CSV/JSON data and dataset docs
- \`prompts/\` — Prompt templates
- \`notes/\` — Call notes, prep guides

> Source of truth: private Notebook LM workspace (mirrored here when possible).
EOF"
  echo "created: README.md"
else
  echo "keep: README.md (already exists)"
fi

say "Done."
echo
echo "Next steps:"
echo "  1) Review changes: git status && git diff --name-status"
echo "  2) Commit (if not already staged by git mv/rm):"
echo "       git add -A && git commit -m 'chore: repo reorg into analysis/ finance/ network/ datasets/ prompts/ notes'"
echo "  3) Push & PR:"
echo "       git push -u origin HEAD"
echo "       # Open a PR on GitHub and review"