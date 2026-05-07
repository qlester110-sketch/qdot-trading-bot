---
description: Midday scan — cut losers, tighten stops on winners, thesis check
---

Local version of routines/midday.md. Credentials come from `.env`.

1. Read memory/TRADING-STRATEGY.md, tail of memory/TRADE-LOG.md
   (entries + thesis per open position), today's RESEARCH-LOG entry.

2. Confirm `ALPACA_ENDPOINT` contains "paper-api". If not, STOP.

3. Pull state: `bash scripts/alpaca.sh positions`, `orders`. Split by
   `asset_class`: `us_equity` = stock book, `us_option` = options sleeve.

4. **Stock book — losers.** For every stock position with
   `unrealized_plpc <= -0.07`:
   - `bash scripts/alpaca.sh close SYM`
   - `bash scripts/alpaca.sh cancel ORDER_ID` (its trailing stop)
   - Append a CLOSE block to TRADE-LOG per the format reference,
     including the calibration sub-block (predicted direction,
     predicted materiality, move from entry to exit, hit yes/no).
     Hit definition: predicted bullish + exit move > 0 = hit;
     predicted bearish + exit move < 0 = hit; otherwise miss.

5. **Stock book — tighten winners.** Cancel old stop, place new one:
   - Up ≥ +20% → `trail_percent`: "5"
   - Up ≥ +15% (and < +20%) → `trail_percent`: "7"
   Never tighten within 3% of current price. Never move a stop down.

6. **Options sleeve — exit checks** (apply per position, in order):
   - DTE ≤ 21 → close at market regardless of P&L (forced close rule)
   - `unrealized_plpc <= -0.50` → close at market (-50% premium cut)
   - `unrealized_plpc >= +1.00` → close at market (+100% take)
   - Underlying thesis broken (catalyst invalidated) → close
   To close: `bash scripts/alpaca.sh order '{"symbol":"OCC","qty":"N","side":"sell","type":"market","time_in_force":"day","position_intent":"sell_to_close"}'`
   Append a CLOSE block to TRADE-LOG per the format reference, with
   the calibration sub-block. For options, the "move from entry to
   exit" is the underlying's close-to-close move, not the option's
   premium move (calibration measures whether the directional thesis
   was right; premium P&L is recorded separately).

7. **Thesis check** on each remaining position (stock + options). If
   the underlying catalyst is invalidated, close even if no exit rule
   has fired. Document reasoning.

8. Optional intraday WebSearch if something is moving sharply with no
   obvious cause. Append addendum to today's RESEARCH-LOG.

9. Optional: `bash scripts/slack.sh "<action summary>"` if action taken.
