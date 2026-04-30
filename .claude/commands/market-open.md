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
   - `bash scripts/alpaca.sh quote <ticker>` for each planned trade

4. Hard-check rules BEFORE every order. Skip and log any trade that
   fails: positions ≤ 6, weekly trades ≤ 3, position cost ≤ 20% of
   equity, catalyst documented, daytrade_count leaves room, instrument
   is a stock.

5. Place buys (market, day TIF), wait for fill, then place 10%
   trailing stop GTC. PDT fallback ladder: trailing → fixed stop →
   queue for tomorrow AM.

6. Append each trade to memory/TRADE-LOG.md.

7. Optional: `bash scripts/slack.sh "<trade summary>"`.
