---
description: Manual trade helper with strategy-rule validation. Usage — /trade SYMBOL SHARES buy|sell
---

Execute a manual trade with full rule validation. Refuse if any rule fails.

Args: SYMBOL SHARES SIDE (buy or sell). If missing, ask.

1. Pull state: `bash scripts/alpaca.sh account`, `positions`, and
   `quote SYMBOL` (capture ask price P).

2. For BUY, validate every rule. If any fail, STOP and print the failed
   checks; do not place an order:
   - Total positions after fill ≤ 6
   - Trades this week + 1 ≤ 3 (count entries dated Mon–today in
     memory/TRADE-LOG.md)
   - SHARES * P ≤ 20% of equity
   - SHARES * P ≤ available cash
   - daytrade_count < 3
   - Catalyst documented in today's RESEARCH-LOG (if not, ask the user
     for the thesis and add it before continuing)
   - Endpoint is paper (`ALPACA_ENDPOINT` contains "paper-api")

3. For SELL, confirm position exists with right qty. No other checks.

4. Print the order JSON and the validation results, then ask
   "execute? (y/n)".

5. On confirm:
   ```
   bash scripts/alpaca.sh order \
     '{"symbol":"SYM","qty":"N","side":"buy|sell","type":"market","time_in_force":"day"}'
   ```

6. For BUYs, immediately place a 10% trailing stop GTC (same flow as
   market-open STEP 5).

7. Log to memory/TRADE-LOG.md with full thesis, entry, stop, target,
   R:R, and order IDs.

8. `bash scripts/slack.sh "<trade summary>"` (optional in local mode).
