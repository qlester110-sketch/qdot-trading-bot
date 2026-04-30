#!/usr/bin/env bash
# Notification wrapper. Posts to Slack.
# Usage: bash scripts/slack.sh "<message>"
# If credentials are unset, appends to a local fallback file (gitignored).
#
# Two modes, in order of preference:
#   1. SLACK_WEBHOOK_URL  — incoming webhook (recommended, simplest)
#   2. SLACK_BOT_TOKEN + SLACK_CHANNEL — bot token API call

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ENV_FILE="$ROOT/.env"
FALLBACK="$ROOT/DAILY-SUMMARY.md"

if [[ -f "$ENV_FILE" ]]; then
  set -a
  # shellcheck disable=SC1090
  source "$ENV_FILE"
  set +a
fi

if [[ $# -gt 0 ]]; then
  msg="$*"
else
  msg="$(cat)"
fi

if [[ -z "${msg// /}" ]]; then
  echo "usage: bash scripts/slack.sh \"<message>\"" >&2
  exit 1
fi

stamp="$(date '+%Y-%m-%d %H:%M %Z')"

# Fallback to local file if no Slack creds are configured at all.
if [[ -z "${SLACK_WEBHOOK_URL:-}" && -z "${SLACK_BOT_TOKEN:-}" ]]; then
  printf "\n---\n## %s (fallback — Slack not configured)\n%s\n" "$stamp" "$msg" >> "$FALLBACK"
  echo "[slack fallback] appended to DAILY-SUMMARY.md"
  echo "$msg"
  exit 0
fi

# Mode 1: Incoming webhook (preferred).
if [[ -n "${SLACK_WEBHOOK_URL:-}" ]]; then
  payload="$(python3 -c "
import json, sys
print(json.dumps({'text': sys.argv[1]}))
" "$msg")"
  curl -fsS -X POST \
    -H "Content-Type: application/json" \
    -d "$payload" \
    "$SLACK_WEBHOOK_URL"
  echo
  exit 0
fi

# Mode 2: Bot token via chat.postMessage.
: "${SLACK_CHANNEL:?SLACK_BOT_TOKEN set but SLACK_CHANNEL not set}"

payload="$(python3 -c "
import json, sys
print(json.dumps({'channel': sys.argv[1], 'text': sys.argv[2]}))
" "$SLACK_CHANNEL" "$msg")"

curl -fsS -X POST https://slack.com/api/chat.postMessage \
  -H "Authorization: Bearer $SLACK_BOT_TOKEN" \
  -H "Content-Type: application/json; charset=utf-8" \
  -d "$payload"
echo
