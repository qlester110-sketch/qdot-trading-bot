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

4. Pull structured signal from Alpaca (free, fast):
   - `bash scripts/alpaca.sh movers 10` — top gainers/losers
   - `bash scripts/alpaca.sh news <comma-sep held tickers> 20` — news
     on every currently-held position. Skip if no positions.
   - `bash scripts/alpaca.sh news <top 3–5 mover tickers> 10` —
     catalyst headlines for the biggest movers.

5. Research using native WebSearch (cite every claim):
   - WTI / Brent oil
   - S&P 500 futures premarket
   - VIX level
   - Top market catalysts today
   - Earnings before open
   - Economic calendar (CPI / PPI / FOMC / jobs)
   - Sector momentum
   - WebSearch the top 3–5 movers from step 4 for a catalyst — only
     trade movers with a real, identifiable catalyst.

6. Append a dated entry to memory/RESEARCH-LOG.md matching the format
   reference at the top of that file. Include: top movers w/ catalyst,
   held-ticker news summary, decision (TRADE or HOLD, default HOLD).

7. Optional: `bash scripts/slack.sh "<one line>"` only if urgent.
