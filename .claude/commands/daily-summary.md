---
description: End-of-day snapshot to TRADE-LOG and Slack
---

Local version of routines/daily-summary.md. Credentials come from `.env`.

1. Read tail of memory/TRADE-LOG.md to find yesterday's EOD equity
   (needed for Day P&L). Count today's trades and Mon-today's trades.

2. Confirm `ALPACA_ENDPOINT` contains "paper-api". If not, STOP.

3. Pull final state: `bash scripts/alpaca.sh account`, `positions`,
   `orders`.

4. Compute metrics. Split positions by `asset_class` (`us_equity` vs
   `us_option`) so stock and option P&L are reported separately:
   - Day P&L ($ and %) = today_equity − yesterday_equity (whole portfolio)
   - Stock book day P&L ($ and %) — change in `us_equity` market value
   - Options sleeve day P&L ($ and %) — change in `us_option` market value
   - Phase P&L ($ and %) = today_equity − $10,000 (working cap baseline)
   - Stock book deployed: $X / $3,000 cap
   - Options sleeve in use: $X premium / $500 cap
   - Trades today (split: stocks vs options, or "none")
   - Trades this week (Mon–today: stocks ≤ 3, options ≤ 1)

5. Append EOD snapshot to memory/TRADE-LOG.md matching the format
   reference at the top of that file. Note any open option position's
   current DTE so the next day's pre-market knows when 21-DTE hits.

   **Closed-today check.** For any position that closed today (filled
   stop, manual close, target hit), verify a CLOSE block with the
   calibration sub-block was appended (per midday workflow). If it's
   missing — most commonly when a trailing stop hit autonomously after
   midday — append it now using the position's last known entry record
   from the trade log:
   - Look up entry-day close price (from the entry block)
   - Look up exit-day close price (from today's positions data)
   - Compute move from entry to exit (close-to-close, %)
   - Apply hit definition: bullish + move > 0 = hit; bearish + move < 0 = hit; else miss
   - Write the full CLOSE block per the format reference.

   **Horizon-end check.** For any *open* position whose entry was
   exactly N trading days ago (N = its declared horizon), append an
   inline calibration note (NOT a close — the position stays open):
   ```
   #### YYYY-MM-DD — HORIZON-END CALIBRATION SYMBOL (entry: YYYY-MM-DD, horizon: N)
   - Move from entry to today: +/-X%
   - Hit (at horizon): yes | no
   - Note: position remains open; tracking continues to actual close
   ```
   This captures the calibration data point at the originally-locked
   horizon so it isn't biased by a later-than-horizon exit.

6. `bash scripts/slack.sh "EOD <date>\nPortfolio: ...\n..."` (always,
   even on no-trade days; under 15 lines).
