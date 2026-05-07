#!/usr/bin/env bash
# Alpaca API wrapper. All trading API calls go through here.
# Usage: bash scripts/alpaca.sh <subcommand> [args...]
#
# Default endpoint is the PAPER trading host. To use live trading,
# set ALPACA_ENDPOINT=https://api.alpaca.markets/v2 in the environment.
# This wrapper does not enforce paper-only — it just defaults to it.

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ENV_FILE="$ROOT/.env"
if [[ -f "$ENV_FILE" ]]; then
  set -a
  # shellcheck disable=SC1090
  source "$ENV_FILE"
  set +a
fi

: "${ALPACA_API_KEY:?ALPACA_API_KEY not set in environment}"
: "${ALPACA_SECRET_KEY:?ALPACA_SECRET_KEY not set in environment}"

API="${ALPACA_ENDPOINT:-https://paper-api.alpaca.markets/v2}"
DATA="${ALPACA_DATA_ENDPOINT:-https://data.alpaca.markets/v2}"
DATA_BASE="${DATA%/v2}"

H_KEY="APCA-API-KEY-ID: $ALPACA_API_KEY"
H_SEC="APCA-API-SECRET-KEY: $ALPACA_SECRET_KEY"

cmd="${1:-}"
shift || true

case "$cmd" in
  account)
    curl -fsS -H "$H_KEY" -H "$H_SEC" "$API/account"
    ;;
  positions)
    curl -fsS -H "$H_KEY" -H "$H_SEC" "$API/positions"
    ;;
  position)
    sym="${1:?usage: position SYM}"
    curl -fsS -H "$H_KEY" -H "$H_SEC" "$API/positions/$sym"
    ;;
  quote)
    sym="${1:?usage: quote SYM}"
    curl -fsS -H "$H_KEY" -H "$H_SEC" "$DATA/stocks/$sym/quotes/latest"
    ;;
  orders)
    status="${1:-open}"
    curl -fsS -H "$H_KEY" -H "$H_SEC" "$API/orders?status=$status"
    ;;
  order)
    body="${1:?usage: order '<json>'}"
    curl -fsS -H "$H_KEY" -H "$H_SEC" -H "Content-Type: application/json" \
      -X POST -d "$body" "$API/orders"
    ;;
  cancel)
    oid="${1:?usage: cancel ORDER_ID}"
    curl -fsS -H "$H_KEY" -H "$H_SEC" -X DELETE "$API/orders/$oid"
    ;;
  cancel-all)
    curl -fsS -H "$H_KEY" -H "$H_SEC" -X DELETE "$API/orders"
    ;;
  close)
    sym="${1:?usage: close SYM}"
    curl -fsS -H "$H_KEY" -H "$H_SEC" -X DELETE "$API/positions/$sym"
    ;;
  close-all)
    curl -fsS -H "$H_KEY" -H "$H_SEC" -X DELETE "$API/positions"
    ;;
  news)
    syms="${1:-}"
    limit="${2:-20}"
    if [[ -n "$syms" ]]; then
      curl -fsS -H "$H_KEY" -H "$H_SEC" \
        "$DATA_BASE/v1beta1/news?symbols=$syms&limit=$limit&sort=desc"
    else
      curl -fsS -H "$H_KEY" -H "$H_SEC" \
        "$DATA_BASE/v1beta1/news?limit=$limit&sort=desc"
    fi
    ;;
  movers)
    top="${1:-10}"
    curl -fsS -H "$H_KEY" -H "$H_SEC" \
      "$DATA_BASE/v1beta1/screener/stocks/movers?top=$top"
    ;;
  option-chain)
    # Lists active option contracts for an underlying. Optional flags:
    #   $2 expiration_date_gte (YYYY-MM-DD), $3 expiration_date_lte,
    #   $4 type (call|put), $5 strike_price_gte, $6 strike_price_lte
    sym="${1:?usage: option-chain UNDERLYING [exp_gte] [exp_lte] [type] [strike_gte] [strike_lte]}"
    qs="underlying_symbols=$sym&status=active&limit=1000"
    [[ -n "${2:-}" ]] && qs+="&expiration_date_gte=$2"
    [[ -n "${3:-}" ]] && qs+="&expiration_date_lte=$3"
    [[ -n "${4:-}" ]] && qs+="&type=$4"
    [[ -n "${5:-}" ]] && qs+="&strike_price_gte=$5"
    [[ -n "${6:-}" ]] && qs+="&strike_price_lte=$6"
    curl -fsS -H "$H_KEY" -H "$H_SEC" "$API/options/contracts?$qs"
    ;;
  option-snapshot)
    # Latest snapshot (quote, greeks, IV) for one OCC option symbol.
    occ="${1:?usage: option-snapshot OCC_SYMBOL  e.g. AAPL250620C00100000}"
    curl -fsS -H "$H_KEY" -H "$H_SEC" \
      "$DATA_BASE/v1beta1/options/snapshots?symbols=$occ&feed=indicative"
    ;;
  option-chain-snapshot)
    # Snapshots for a whole chain (greeks/IV across strikes/expirations).
    sym="${1:?usage: option-chain-snapshot UNDERLYING}"
    curl -fsS -H "$H_KEY" -H "$H_SEC" \
      "$DATA_BASE/v1beta1/options/snapshots/$sym?feed=indicative&limit=1000"
    ;;
  *)
    echo "Usage: bash scripts/alpaca.sh <account|positions|position|quote|orders|order|cancel|cancel-all|close|close-all|news|movers|option-chain|option-snapshot|option-chain-snapshot> [args]" >&2
    exit 1
    ;;
esac

echo
