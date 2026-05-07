---
description: Pre-market research workflow (local, no commit/push)
---

Local version of routines/pre-market.md. Same logic, but credentials come
from `.env` and there's no commit/push step.

1. Read memory/PROJECT-CONTEXT.md, memory/TRADING-STRATEGY.md,
   memory/UNIVERSE.md (the 35-ticker locked watchlist),
   tail of memory/TRADE-LOG.md, tail of memory/RESEARCH-LOG.md.

2. Pull live state:
   - `bash scripts/alpaca.sh account`
   - `bash scripts/alpaca.sh positions`
   - `bash scripts/alpaca.sh orders`

3. Confirm `ALPACA_ENDPOINT` contains "paper-api". If not, STOP.

4. Pull structured signal from Alpaca (free, fast). Universe-first:
   - `bash scripts/alpaca.sh news <comma-sep held tickers> 20` — news
     on every currently-held position (stocks AND option underlyings).
     Skip if no positions.
   - `bash scripts/alpaca.sh news <UNIVERSE.md tickers, batched> 30` —
     news scan across the locked 35-ticker universe. This is the
     primary source of trade ideas; movers below are secondary.
   - `bash scripts/alpaca.sh movers 10` — top gainers/losers, but
     filter to UNIVERSE tickers only when generating trade ideas.
     Out-of-universe movers can be noted but do NOT become candidates
     without explicit owner override.
   - `bash scripts/alpaca.sh news <UNIVERSE movers, if any> 10` —
     catalyst headlines for any UNIVERSE name appearing in movers.

5. **Options sleeve health check** (skip if no open option positions):
   For each open option position from step 2:
   - Compute DTE. If DTE ≤ 21, flag for forced close in the market-open
     workflow today (per §Options Sleeve rule #9).
   - `bash scripts/alpaca.sh option-snapshot <OCC_SYMBOL>` — current
     greeks, IV, mark.
   - WebSearch underlying for an earnings date within the next 14 days.
     If earnings hits while position is open, IV crush risk; flag in
     research log so midday can re-evaluate.

6. Research using native WebSearch (cite every claim):
   - WTI / Brent oil
   - S&P 500 futures premarket
   - VIX level (also feeds the options sleeve — high VIX = expensive premium)
   - Top market catalysts today
   - Earnings before open
   - Economic calendar (CPI / PPI / FOMC / jobs)
   - Sector momentum
   - WebSearch the top 3–5 movers from step 4 for a catalyst — only
     trade movers with a real, identifiable catalyst.

7. Append a dated entry to memory/RESEARCH-LOG.md matching the format
   reference at the top of that file. Include: UNIVERSE news summary,
   top UNIVERSE movers w/ catalyst, held-ticker news summary, options
   sleeve flags (if any), decision (TRADE or HOLD, default HOLD). For
   every Trade Idea, the entry MUST include the four calibration
   fields per the format reference: direction (bull/bear), materiality
   (0.0–1.0; reject if <0.6), horizon (trading days, default 10),
   catalyst type. **Trade ideas must be UNIVERSE tickers** unless
   tagged with an `out_of_universe: true` field plus a written
   override justification. Skipping any required field makes the
   trade ineligible at /market-open. If a stock-trade candidate
   emerges AND the strategy supports an options expression of the
   same thesis, note that — but never trade options without the
   underlying stock thesis also passing the buy-side gate.

7. Optional: `bash scripts/slack.sh "<one line>"` only if urgent.
