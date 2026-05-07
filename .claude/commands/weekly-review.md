---
description: Friday weekly review — stats, lessons, grade
---

Local version of routines/weekly-review.md. Credentials come from `.env`.

1. Read memory/PROJECT-CONTEXT.md, memory/WEEKLY-REVIEW.md (match the
   format reference exactly), all this week's TRADE-LOG and
   RESEARCH-LOG entries, memory/TRADING-STRATEGY.md.

2. Confirm `ALPACA_ENDPOINT` contains "paper-api". If not, STOP.

3. Pull week-end state: `bash scripts/alpaca.sh account`, `positions`.

4. Compute the week's metrics. Report stock book and options sleeve
   separately — they have different sizing, win-rate, and risk profiles
   and shouldn't be aggregated when judging strategy effectiveness:
   - Starting portfolio (Monday AM equity)
   - Ending portfolio
   - Week return ($ and %)
   - S&P 500 week return (WebSearch, cite source)
   - **Stock book:** trades (W / L / open), win rate, best/worst, profit factor
   - **Options sleeve:** trades (W / L / open), win rate, best/worst,
     profit factor, average DTE at exit, % of exits hitting each rule
     (-50% / +100% / 21 DTE / thesis-break)
   - Sleeve cap utilization across the week (was $500 ever exceeded?)

5. **Calibration metrics** — separate from P&L. Computed from the
   calibration sub-blocks in TRADE-LOG.md (CLOSE blocks + HORIZON-END
   blocks). Includes ALL closed/horizon-resolved trades since launch,
   not just this week — calibration accumulates.

   Compute:
   - Total resolved trades (closed or hit horizon-end)
   - Overall hit rate
   - Hit rate by sector (sector → wins/total)
   - Hit rate by catalyst type (earnings/guidance/contract/regulatory/macro/sector_rotation)
   - Hit rate by predicted direction (bullish vs bearish — relevant once options sleeve has activity)
   - Materiality vs accuracy: bucket trades into materiality 0.6–0.7,
     0.7–0.8, 0.8+, report hit rate per bucket. Higher buckets should
     have higher hit rates if the materiality scoring is honest.

   Apply the accuracy band recommendation (per TRADING-STRATEGY.md
   §Calibration). With < 20 resolved trades, report the count and
   skip the band recommendation. Otherwise:
   - ≥ 65%: strong signal, current sizing appropriate
   - 55–64%: moderate, no changes
   - 45–54%: weak, review catalyst-classification discipline
   - < 45%: PAUSE new entries; investigate before next Monday open

   Document the band recommendation in WEEKLY-REVIEW.md alongside the
   P&L grade. If the band says PAUSE, that overrides any other
   strategy change in this review.

6. Append a full review section to memory/WEEKLY-REVIEW.md matching
   the format reference. Letter grade A–F. Include the calibration
   block from step 5 with the band recommendation explicit.

7. If a rule needs to change (proven for 2+ weeks or failed badly),
   update memory/TRADING-STRATEGY.md and call out the change in the
   review. A calibration band of < 45% is grounds for an immediate
   strategy change (typically: pause entries or tighten the
   materiality threshold) without waiting the usual 2-week cooldown.

8. `bash scripts/slack.sh "Week ending ..."` (under 15 lines).
