---
description: Market-open execution workflow (local, no commit/push)
---

Local version of routines/market-open.md. Credentials come from `.env`.

1. Read memory/TRADING-STRATEGY.md, today's memory/RESEARCH-LOG.md
   entry (if missing, run the pre-market workflow first), tail of
   memory/TRADE-LOG.md.

2. Confirm `ALPACA_ENDPOINT` contains "paper-api". If not, STOP.

3. Re-validate with live data:
   - `bash scripts/alpaca.sh account`
   - `bash scripts/alpaca.sh positions`
   - For stock candidates: `bash scripts/alpaca.sh quote <ticker>`
   - For option candidates: `bash scripts/alpaca.sh option-chain <UND> <exp_gte> <exp_lte> <call|put>` then `option-snapshot <OCC>` for the chosen strike

4. **Forced option closes first** (from pre-market flags):
   For any open option position with DTE ≤ 21, close immediately:
   ```
   bash scripts/alpaca.sh order \
     '{"symbol":"OCC_SYMBOL","qty":"1","side":"sell","type":"market","time_in_force":"day","position_intent":"sell_to_close"}'
   ```
   Log to TRADE-LOG with reason "21-DTE rule".

5. **Hard-check rules per order type**. Skip and log any trade that fails.

   **Stock orders** (sizing is % of $10k working cap, not account equity):
   - Stock positions after this fill ≤ 6
   - Weekly stock trades ≤ 3
   - Position cost ≤ 10% of $10k = $1,000
   - Existing stock book MV + this fill ≤ 30% of $10k = $3,000
   - Position cost ≤ available cash
   - Fundamental catalyst documented in today's RESEARCH-LOG
   - Falsification documented
   - daytrade_count < 3

   **Option orders** (long calls/puts only):
   - Open option positions after this fill ≤ 2
   - Weekly option trades ≤ 1
   - Premium paid this trade ≤ $250 (2.5% of $10k)
   - Sum of premium across all option positions after fill ≤ $500 (5%)
   - Side is `buy_to_open`; type is `call` or `put`; NO spreads, NO selling-to-open
   - DTE at entry between 30 and 90
   - Delta between 0.50 and 0.70 (from option-snapshot)
   - No earnings on the underlying within next 7 calendar days
   - Underlying independently passes the stock buy-side gate (catalyst, sector, falsification all logged)

6. **Place stock buys** (market, day TIF), wait for fill, then place 10%
   trailing stop GTC. PDT fallback ladder: trailing → fixed stop →
   queue for tomorrow AM.

7. **Place option buys** (limit at mark or mid of bid/ask, day TIF):
   ```
   bash scripts/alpaca.sh order \
     '{"symbol":"OCC_SYMBOL","qty":"1","side":"buy","type":"limit","limit_price":"X.XX","time_in_force":"day","position_intent":"buy_to_open"}'
   ```
   No automatic stop on options — exits are managed manually at midday
   per the -50% / +100% / 21-DTE rules. Set a calendar/research-log
   reminder for the 21-DTE forced-close date.

8. Append each trade to memory/TRADE-LOG.md. For options, include OCC
   symbol, strike, expiry, DTE at entry, IV at entry, delta at entry,
   premium paid, and the underlying-thesis catalyst.

9. Optional: `bash scripts/slack.sh "<trade summary>"`.
