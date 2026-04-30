---
description: Friday weekly review — stats, lessons, grade
---

Local version of routines/weekly-review.md. Credentials come from `.env`.

1. Read memory/PROJECT-CONTEXT.md, memory/WEEKLY-REVIEW.md (match the
   format reference exactly), all this week's TRADE-LOG and
   RESEARCH-LOG entries, memory/TRADING-STRATEGY.md.

2. Confirm `ALPACA_ENDPOINT` contains "paper-api". If not, STOP.

3. Pull week-end state: `bash scripts/alpaca.sh account`, `positions`.

4. Compute the week's metrics:
   - Starting portfolio (Monday AM equity)
   - Ending portfolio
   - Week return ($ and %)
   - S&P 500 week return (WebSearch, cite source)
   - Trades (W / L / open), win rate, best/worst, profit factor

5. Append a full review section to memory/WEEKLY-REVIEW.md matching
   the format reference. Letter grade A–F.

6. If a rule needs to change (proven for 2+ weeks or failed badly),
   update memory/TRADING-STRATEGY.md and call out the change in the
   review.

7. `bash scripts/slack.sh "Week ending ..."` (under 15 lines).
