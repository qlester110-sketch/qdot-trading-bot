---
description: Manual trade helper with strategy-rule validation. Usage — /trade SYMBOL QTY buy|sell  (stocks)  or  /trade OCC_SYMBOL CONTRACTS buy|sell  (options)
---

Execute a manual trade with full rule validation. Refuse if any rule fails.
Working capital is $10k; all percentage rules anchor there, not to Alpaca
account equity.

Args: SYMBOL QTY SIDE. If missing, ask. Detect instrument by symbol shape:
- Plain ticker (1–5 letters, e.g. AAPL) → **stock** path
- OCC symbol (15–21 chars, contains digits + C/P, e.g. AAPL260620C00100000)
  → **option** path

## Stock path

1. Pull state: `bash scripts/alpaca.sh account`, `positions`, and
   `quote SYMBOL` (capture ask price P).

2. For BUY, validate every rule against $10k working cap. If any fail,
   STOP and print the failed checks; do not place an order:
   - **Symbol is in `memory/UNIVERSE.md`** (the locked 35-ticker
     watchlist). If not, refuse unless the user provides explicit
     override + written justification recorded in today's RESEARCH-LOG
     with `out_of_universe: true`.
   - Total stock positions after fill ≤ 6
   - Stock trades this week + 1 ≤ 3 (count entries dated Mon–today in TRADE-LOG)
   - QTY * P ≤ $1,000 (10% of $10k working cap)
   - (Existing stock book market value + QTY * P) ≤ $3,000 (30% of $10k)
   - QTY * P ≤ available cash
   - daytrade_count < 3
   - **Fundamental catalyst** documented in today's RESEARCH-LOG.
     TA-only setups rejected. If no catalyst is logged, ask the user for
     the thesis and write it to RESEARCH-LOG before continuing.
   - **Catalyst type** classified: earnings | guidance | contract |
     regulatory | macro | sector_rotation.
   - **Direction** declared: `bullish` or `bearish` (long stock = bullish).
   - **Materiality** rated 0.0–1.0; reject if < 0.6 per
     TRADING-STRATEGY.md §Calibration scale.
   - **Horizon** locked: N trading days (default 10), set BEFORE entry.
   - **Falsification** documented.
   - Endpoint is paper (`ALPACA_ENDPOINT` contains "paper-api")

3. For SELL, confirm position exists with right qty. No other checks.

4. Print the order JSON and validation results, ask "execute? (y/n)".

5. On confirm:
   ```
   bash scripts/alpaca.sh order \
     '{"symbol":"SYM","qty":"N","side":"buy|sell","type":"market","time_in_force":"day"}'
   ```

6. For BUYs, immediately place a 10% trailing stop GTC (same flow as
   market-open).

7. Log to TRADE-LOG with full entry block per the format reference,
   including catalyst, catalyst type, direction, materiality, horizon,
   falsification, entry, stop, target, R:R, order IDs. The horizon is
   locked at this point — do NOT revise it after the fact.

## Option path

1. Pull state: `bash scripts/alpaca.sh account`, `positions`,
   `option-snapshot OCC_SYMBOL` (capture mark, IV, delta, expiration).

2. For BUY (= `buy_to_open`), validate against $10k working cap. STOP
   on any failure:
   - **Underlying is in `memory/UNIVERSE.md`** (locked 35-ticker
     watchlist). Same override rule as stocks if not.
   - Long calls/puts only — symbol type field must be `call` or `put`
   - SIDE is `buy` (we never sell-to-open)
   - Open option positions after fill ≤ 2
   - Option trades this week + 1 ≤ 1
   - Premium per contract * 100 * CONTRACTS ≤ $250 (2.5% of $10k)
   - Sum of all option premium exposure after fill ≤ $500 (5% of $10k)
   - DTE between 30 and 90 (compute from expiration_date)
   - Delta between 0.50 and 0.70
   - Underlying has no earnings within next 7 calendar days (WebSearch verify)
   - **Underlying independently passes the stock buy-side gate** —
     fundamental catalyst + catalyst type + direction + materiality
     (≥ 0.6) + horizon + falsification all documented in RESEARCH-LOG.
   - For long calls: direction must be `bullish`. For long puts: must
     be `bearish`. Mismatch is an automatic reject.
   - daytrade_count < 3
   - Endpoint is paper

3. For SELL (= `sell_to_close`), confirm position exists. No other checks.

4. Print the order JSON, validation results, ask "execute? (y/n)".

5. On confirm — limit order at the mark or mid of bid/ask:
   ```
   bash scripts/alpaca.sh order \
     '{"symbol":"OCC","qty":"N","side":"buy|sell","type":"limit","limit_price":"X.XX","time_in_force":"day","position_intent":"buy_to_open|sell_to_close"}'
   ```

6. **No automatic stop on options.** Exits managed manually at midday
   per -50% / +100% / 21-DTE rules. Note the 21-DTE forced-close date
   in TRADE-LOG.

7. Log to TRADE-LOG with: OCC symbol, strike, expiry, DTE at entry,
   IV at entry, delta at entry, premium paid, underlying-thesis
   catalyst, underlying falsification, 21-DTE forced-close date,
   order ID.

8. `bash scripts/slack.sh "<trade summary>"` (optional in local mode).
