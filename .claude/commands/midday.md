---
description: Midday scan — cut losers, tighten stops on winners, thesis check
---

Local version of routines/midday.md. Credentials come from `.env`.

1. Read memory/TRADING-STRATEGY.md, tail of memory/TRADE-LOG.md
   (entries + thesis per open position), today's RESEARCH-LOG entry.

2. Confirm `ALPACA_ENDPOINT` contains "paper-api". If not, STOP.

3. Pull state: `bash scripts/alpaca.sh positions`, `orders`.

4. For every position with `unrealized_plpc <= -0.07`:
   - `bash scripts/alpaca.sh close SYM`
   - `bash scripts/alpaca.sh cancel ORDER_ID` (its trailing stop)
   - Log exit to TRADE-LOG.

5. Tighten trailing stops on winners. Cancel old stop, place new one:
   - Up ≥ +20% → `trail_percent`: "5"
   - Up ≥ +15% (and < +20%) → `trail_percent`: "7"
   Never tighten within 3% of current price. Never move a stop down.

6. Thesis check on each open position. If catalyst is invalidated,
   close even if not at -7%. Document reasoning.

7. Optional intraday WebSearch if something is moving sharply with no
   obvious cause. Append addendum to today's RESEARCH-LOG.

8. Optional: `bash scripts/slack.sh "<action summary>"` if action taken.
