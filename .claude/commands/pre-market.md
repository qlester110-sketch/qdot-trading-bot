---
description: Pre-market research workflow (local, no commit/push)
---

Local version of routines/pre-market.md. Same logic, but credentials come
from `.env` and there's no commit/push step.

1. Read memory/PROJECT-CONTEXT.md, memory/TRADING-STRATEGY.md,
   tail of memory/TRADE-LOG.md, tail of memory/RESEARCH-LOG.md.

2. Pull live state:
   - `bash scripts/alpaca.sh account`
   - `bash scripts/alpaca.sh positions`
   - `bash scripts/alpaca.sh orders`

3. Confirm `ALPACA_ENDPOINT` contains "paper-api". If not, STOP.

4. Research using native WebSearch (cite every claim):
   - WTI / Brent oil
   - S&P 500 futures premarket
   - VIX level
   - Top market catalysts today
   - Earnings before open
   - Economic calendar (CPI / PPI / FOMC / jobs)
   - Sector momentum
   - News on any held ticker

5. Append a dated entry to memory/RESEARCH-LOG.md matching the format
   reference at the top of that file. Decision: TRADE or HOLD (default
   HOLD).

6. Optional: `bash scripts/slack.sh "<one line>"` only if urgent.
