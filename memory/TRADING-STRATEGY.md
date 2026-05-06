# Trading Strategy

## Frame: Satellite Sleeve

This bot is the **satellite** sleeve per
[INVESTING-FOUNDATION.md](INVESTING-FOUNDATION.md) Section 3 — not a
whole-portfolio plan. The sizing rules below (20% per position, 75–85%
deployed) are *internal* to this paper account. Whole-portfolio rules
from the foundation doc still apply: total active satellite ≤ 20% of
total investable assets; no single name > 5% of total investable assets.
Bot is also bound by the foundation doc's 24-month underperformance
kill rule (satellite must beat its benchmark over 24 months or be shut
down) — restated here for the 90-day paper window in PROJECT-CONTEXT.md.

## Mission

Beat the S&P 500 over the 90-day paper-trading window. Stocks only — no
options, ever. This is a learning experiment; discipline is the goal even
though the money is paper.

## Capital & Constraints

- Starting capital: ~$10,000 (paper)
- Platform: Alpaca paper trading
- Instruments: Stocks ONLY (no options, no crypto, no futures, no forex)
- PDT limit: 3 day trades per 5 rolling business days (account < $25k)

## Core Rules (non-negotiable)

1. NO OPTIONS — ever
2. **Max 30% of equity deployed at any time** (owner-set ceiling, 2026-05-05). Cash + unused buying power = 70% minimum. Replaces the prior "75–85% deployed" target.
3. 5–6 positions at a time, **max 10% per position** (revised down from 20% to align with rule #2).
4. 10% trailing stop on every position as a real GTC order
5. Cut losers at -7% manually
6. Tighten trail: 7% at +15%, 5% at +20%
7. Never within 3% of current price; never move a stop down
8. Max 3 new trades per week (Monday counts as start of week)
9. Follow sector momentum
10. Exit a sector after 2 consecutive failed trades in that sector
11. Patience > activity. A week with zero trades can be the right answer.

### Grandfathered exception (one-time)

The 3 BUY orders queued 2026-05-05 (QLYS, QRVO, COTY at ~$2k each = ~60% deployed) were placed under the prior 20%/position rule. Owner elected to keep them in flight as calibration trades. All trades placed AFTER 2026-05-05 follow rules #2 and #3 above.

## Buy-side Gate

Before placing any buy order, every check must pass. If any fail, skip
the trade and log the reason.

- Total positions after this fill ≤ 6
- Total trades placed this week (including this one) ≤ 3
- Position cost ≤ 10% of account equity
- Total deployed (existing positions market value + this fill) ≤ 30% of equity
- Position cost ≤ available cash
- Pattern day trader day-trade count leaves room (under 3 on a sub-$25k
  account)
- A specific catalyst is documented in today's research log entry
- The instrument is a stock (not an option, not anything else)

## Sell-side Rules

Evaluated at the midday scan and opportunistically:

- If unrealized loss is -7% or worse, close immediately
- If thesis has broken (catalyst invalidated, sector rolling over, news
  event), close even if not yet at -7%
- If position is up +20% or more, tighten trailing stop to 5%
- If position is up +15% or more, tighten trailing stop to 7%
- If a sector has two consecutive failed trades, exit all positions in
  that sector

## Entry Checklist

Before any buy, document all of these in TRADE-LOG:

- Specific catalyst (fundamental, citable)?
- Source classification: must be a **fundamental** catalyst (earnings,
  guidance, contract win, regulatory event, sector rotation with
  macroeconomic cause). Technical signals (chart patterns, RSI, MA
  crosses) may corroborate but never lead. Per
  INVESTING-FOUNDATION.md §7, weak-form efficiency means TA-only setups
  have no academic edge.
- Falsification: what specific, observable event would prove the thesis
  wrong and trigger an exit before the stop is hit?
- Sector in momentum?
- Stop level (7–10% below entry)?
- Target (minimum 2:1 R:R)?

## Strategy Change Process

This file is read-only on weekdays. It only changes on Friday weekly
review, and only if a rule has proven out for 2+ weeks or failed badly.
Document any change in WEEKLY-REVIEW.md alongside the strategy update.
