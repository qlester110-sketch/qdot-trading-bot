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

Beat the S&P 500 over the 90-day paper-trading window. Stocks are the core
book; a small long-premium options sleeve is permitted under §Options
Sleeve below. This is a learning experiment; discipline is the goal even
though the money is paper.

## Capital & Constraints

- **Working capital: $10,000** (owner-set, 2026-05-07). Alpaca paper accounts default-fund at $100k; we deliberately treat the working slice as $10k. ALL percentages in this document are of the $10k working cap, NOT of the live Alpaca equity reading.
- Platform: Alpaca paper trading (options approval level 3, but rules below restrict us to long premium only)
- Instruments: Stocks (core book) + long calls/puts (sleeve). NO crypto, NO futures, NO forex, NO short premium, NO spreads.
- PDT limit: 3 day trades per 5 rolling business days. Alpaca evaluates this against the live account equity ($100k), so PDT will not bite — but the rule is retained as a discipline constraint against day-trading the strategy.

## Core Rules — Stock Book (non-negotiable)

1. **Max 30% of working cap deployed in the stock book at any time** = **$3,000** (owner-set ceiling, 2026-05-05). Remaining $7,000+ stays uncommitted.
2. 5–6 stock positions at a time, **max 10% per stock position** = **$1,000**.
3. 10% trailing stop on every stock position as a real GTC order
4. Cut losers at -7% manually
5. Tighten trail: 7% at +15%, 5% at +20%
6. Never within 3% of current price; never move a stop down
7. Max 3 new stock trades per week (Monday counts as start of week)
8. Follow sector momentum
9. Exit a sector after 2 consecutive failed trades in that sector
10. Patience > activity. A week with zero trades can be the right answer.

## Options Sleeve (non-negotiable; introduced 2026-05-07)

The options sleeve is **separate** from the stock book — it has its own
sizing cap and does not consume the 30% stock deployment budget.

1. **Long calls and long puts ONLY.** No short premium, no spreads, no naked options, no covered calls (yet). Defined risk = premium paid.
2. **Sleeve cap: $500** (5% of $10k working cap) across all open option positions, measured as premium-paid sum at entry. Once $500 of premium is committed, no new trades until something closes.
3. **Per-trade cap: $250** in premium paid (2.5% of $10k working cap). Sized so the sleeve fits 2 trades and a worst-case double-zero is survivable.
4. **Max 2 open option positions** at any time. Max **1 new option trade per week**.
5. **DTE at entry: 30–90 days.** No 0DTE, no weeklies, no LEAPS.
6. **Delta 0.50–0.70 at entry.** Near-ATM or modest ITM. No far-OTM lottery tickets.
7. **No entries within 7 calendar days of the underlying's earnings report** (IV crush risk).
8. **Underlying must independently pass the stock buy-side gate** — fundamental catalyst, sector momentum, documented falsification. No standalone option theses.
9. **Exit rules** (whichever fires first):
   - -50% of premium paid → close
   - +100% of premium paid → close
   - 21 days to expiration → close regardless of P&L
   - Underlying thesis breaks → close
10. **Logging:** every option trade gets the same entry checklist as a stock trade in TRADE-LOG.md, plus contract details (symbol, strike, expiry, DTE, IV at entry, delta).
11. **Caveat:** Alpaca paper option fills, spreads, and assignment are not fully realistic. Treat paper P&L as directional evidence about decision-making, not about real-money outcomes.

### Grandfathered exception (one-time)

The 3 BUY orders queued 2026-05-05 (QLYS, QRVO, COTY at ~$2k each = ~60% deployed) were placed under the prior 20%/position rule on a then-$10k equity baseline. Owner elected to keep them in flight as calibration trades. All trades placed AFTER 2026-05-05 follow rules #1 and #2 above.

## Buy-side Gate

Before placing any buy order, every check must pass. If any fail, skip
the trade and log the reason.

- Total stock positions after this fill ≤ 6
- Total stock trades placed this week (including this one) ≤ 3
- Position cost ≤ 10% of account equity
- Total stock deployed (existing positions market value + this fill) ≤ 30% of equity
- Position cost ≤ available cash
- Pattern day trader day-trade count leaves room (under 3 on a sub-$25k
  account)
- A specific catalyst is documented in today's research log entry
- The instrument is a stock or qualifies under the §Options Sleeve rules — nothing else

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
- **Direction** (`bullish` or `bearish`)? For long stock = bullish; for
  long put = bearish; long call = bullish. Required so calibration can
  measure later whether the call was right.
- **Materiality** (0.0–1.0)? How strong is the catalyst on its own?
  Must be ≥ 0.6 to enter. Calibration scale:
  - 0.9–1.0: definitive (massive beat + raised guidance + sector tailwind)
  - 0.7–0.8: strong (clean earnings beat with one supporting factor)
  - 0.6: minimum (single corroborated catalyst from a primary source)
  - <0.6: reject — the thesis is too weak to commit capital
- **Horizon** (trading days, default 10)? The number of trading days
  over which the catalyst is expected to play out. Locked at entry,
  before the outcome is known.

## Calibration

Every closed trade is appended with a calibration block (see TRADE-LOG
format reference). Friday weekly review computes hit rate by sector and
by catalyst type. Hit definition (binary):

- Predicted bullish + close-to-close move at horizon > 0 → hit
- Predicted bearish + close-to-close move at horizon < 0 → hit
- Otherwise → miss

If a position is closed early (stop hit, -7% cut, thesis break) before
horizon, use the close-to-close move from entry day to exit day instead
of the full horizon.

Accuracy bands inform the Friday review action:

- ≥ 65%: strong signal, current sizing appropriate
- 55–64%: moderate, no changes
- 45–54%: weak, review catalyst-classification discipline
- < 45%: PAUSE new entries until the next weekly review and investigate

Calibration is only meaningful with ≥ 20 closed trades. Below that,
report the count but don't act on the band.

### Pre-calibration trades (one-time exclusion)

The 3 trades placed 2026-05-05 (QLYS, QRVO, COTY) entered before the
calibration framework existed. Their original entries did not declare
direction / materiality / horizon. Retroactively assigning these would
be a hindsight leak. When these positions close, the CLOSE block
includes the standard P&L data, but the calibration sub-block is
written as `Calibration: N/A (pre-calibration entry)` and these trades
are EXCLUDED from all calibration hit-rate metrics in weekly review.

## Universe

Trades must come from `memory/UNIVERSE.md` (35 names across SaaS,
e-commerce, and AI/semis — locked 2026-05-07). The universe is frozen
between scheduled weekly reviews. Adds and drops happen only at weekly
review with explicit owner sign-off documented in WEEKLY-REVIEW.md.

Out-of-universe trades are permitted only if all of the following:

1. Owner explicitly approves *before* entry (not after the fact)
2. Justification written in today's RESEARCH-LOG entry
3. Trade independently passes the buy-side gate (catalyst, falsification,
   materiality ≥ 0.6, direction, horizon)
4. Tagged in TRADE-LOG as `out_of_universe: true`

If more than 2 out-of-universe trades occur in a calendar month, the
universe is re-evaluated at the next weekly review — the override is a
relief valve, not a sieve.

## Framework Freeze

Three framework changes were made on 2026-05-07: options sleeve,
calibration framework, universe lock. To prevent overtuning, no further
strategy changes — including universe adds/drops, sleeve cap changes,
materiality threshold changes, or new instrument types — until the
weekly review on 2026-05-22 (~2 weeks). Exceptions:

- A calibration band of < 45% triggers an immediate review per
  §Calibration (this is not "overtuning"; it's a documented circuit breaker)
- A documented strategy-rule violation requires an immediate change
- Owner explicit override

The point of the freeze is to accumulate clean evidence under one set
of rules before re-tuning.

## Strategy Change Process

This file is read-only on weekdays. It only changes on Friday weekly
review, and only if a rule has proven out for 2+ weeks or failed badly.
Document any change in WEEKLY-REVIEW.md alongside the strategy update.
