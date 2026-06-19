#!/bin/bash
# Claude Code Status Line - Two-line dashboard
# Line 1: Model | Project | Branch +staged ~modified ?untracked
# Line 2: Context bar with color coding | Cost | Duration

input=$(cat)

MODEL=$(echo "$input" | jq -r '.model.display_name // "Claude"')
CWD=$(echo "$input" | jq -r '.workspace.current_dir // "."')
DIR=$(basename "$CWD")
COST=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
CONTEXT_PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0')
DURATION=$(echo "$input" | jq -r '.session.duration_seconds // 0')

# Round context percentage to integer
CONTEXT_PCT=$(printf '%.0f' "$CONTEXT_PCT")

# Git info
BRANCH=$(git -C "$CWD" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)
STAGED=$(git -C "$CWD" --no-optional-locks diff --cached --name-only 2>/dev/null | wc -l | tr -d ' ')
UNSTAGED=$(git -C "$CWD" --no-optional-locks diff --name-only 2>/dev/null | wc -l | tr -d ' ')
UNTRACKED=$(git -C "$CWD" --no-optional-locks ls-files --others --exclude-standard 2>/dev/null | wc -l | tr -d ' ')

# Format duration
MINS=$((DURATION / 60))
SECS=$((DURATION % 60))
if [ "$MINS" -gt 0 ]; then
  TIME_STR="${MINS}m ${SECS}s"
else
  TIME_STR="${SECS}s"
fi

# Context bar (10 chars wide)
FILLED=$((CONTEXT_PCT / 10))
[ "$FILLED" -gt 10 ] && FILLED=10
EMPTY=$((10 - FILLED))
BAR=""
for i in $(seq 1 $FILLED); do BAR="${BAR}▓"; done
for i in $(seq 1 $EMPTY); do BAR="${BAR}░"; done

# Color based on context usage: green < 50%, yellow 50-79%, red >= 80%
if [ "$CONTEXT_PCT" -ge 80 ]; then
  COLOR="\033[31m"
elif [ "$CONTEXT_PCT" -ge 50 ]; then
  COLOR="\033[33m"
else
  COLOR="\033[32m"
fi
RESET="\033[0m"
DIM="\033[2m"
BOLD="\033[1m"
CYAN="\033[36m"

# Line 1: Model | Project | Branch +S ~M ?U
printf "${BOLD}%s${RESET} ${DIM}|${RESET} ${CYAN}%s${RESET}" "$MODEL" "$DIR"
if [ -n "$BRANCH" ]; then
  printf " ${DIM}|${RESET} %s" "$BRANCH"
  # Only show counts if non-zero
  CHANGES=""
  [ "$STAGED" -gt 0 ] && CHANGES="${CHANGES} \033[32m+${STAGED}${RESET}"
  [ "$UNSTAGED" -gt 0 ] && CHANGES="${CHANGES} \033[33m~${UNSTAGED}${RESET}"
  [ "$UNTRACKED" -gt 0 ] && CHANGES="${CHANGES} \033[31m?${UNTRACKED}${RESET}"
  [ -n "$CHANGES" ] && printf "%b" "$CHANGES"
fi

# Newline between lines
echo ""

# Line 2: Context bar | Cost | Duration
printf "${COLOR}${BAR} %d%%${RESET} ${DIM}|${RESET} \$%.2f ${DIM}|${RESET} %s" \
  "$CONTEXT_PCT" "$COST" "$TIME_STR"
