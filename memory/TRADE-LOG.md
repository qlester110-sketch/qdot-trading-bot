# Trade Log

All trades and end-of-day snapshots are appended here in chronological
order. New entries go at the bottom. Format examples appear under the
Day 0 baseline below.

---

## Day 0 — EOD Snapshot (2026-04-30, pre-launch baseline)

**Portfolio:** $10,000.00 | **Cash:** $10,000.00 (100%) | **Day P&L:** $0 | **Phase P&L:** $0

No positions yet. Bot launches on the next trading day.

---

### 2026-05-05 21:44 ET — BUY QLYS (queued for 2026-05-06 open)
- Side: buy
- Shares: 19
- Entry price: pending (market open 2026-05-06)
- Stop level: 10% trailing GTC (placed after fill at /market-open)
- Position size: ~$2,000 (20% of $10k notional baseline)
- Catalyst: Qualys raised FY26 GAAP EPS, Adj EPS, sales guides; Q2 sales beat. Source: Benzinga earnings wire 2026-05-05 22:20–22:24 UTC (RESEARCH-LOG 2026-05-05).
- Falsification: by Fri close gives back >50% of post-earnings gap; or peer (CRWD/S/OKTA) sells off >5% on negative read-through; or any sector peer guides down within 2 weeks.
- Sector: Cybersecurity SaaS
- Target: +20% (R:R 2:1)
- Order ID: 3e7922f6-0299-4d6a-b90f-38cbd2e7f124
- Stop order ID: pending (post-fill)

### 2026-05-05 21:44 ET — BUY QRVO (queued for 2026-05-06 open)
- Side: buy
- Shares: 19
- Entry price: pending (market open 2026-05-06)
- Stop level: 10% trailing GTC (placed after fill at /market-open)
- Position size: ~$2,000 (20% of $10k notional baseline)
- Catalyst: Qorvo FY27 Adj EPS guide $7.00 vs $6.60 est (~6% above forward-year). Source: Benzinga 2026-05-05 22:32 UTC (RESEARCH-LOG 2026-05-05).
- Falsification: stock fades back below pre-earnings close within 5 trading days; or peer (SWKS, AVGO, QCOM) negative read-through within 2 weeks.
- Sector: Semiconductors (RF chips)
- Target: +20% (R:R 2:1)
- Order ID: 549b9138-fa08-4b5a-ad81-d1d50da87bd1
- Stop order ID: pending (post-fill)

### 2026-05-05 21:44 ET — BUY COTY (queued for 2026-05-06 open)
- Side: buy
- Shares: 784
- Entry price: pending (market open 2026-05-06)
- Stop level: 10% trailing GTC (placed after fill at /market-open)
- Position size: ~$2,000 (20% of $10k notional baseline)
- Catalyst: Coty FY26 Adj EPS guide $0.33–0.35 vs $0.27 est (22–30% above). Source: Benzinga 2026-05-05 22:50 UTC (RESEARCH-LOG 2026-05-05).
- Falsification: tomorrow's call commentary shows soft margins or FX-driven raise (not organic); or stock fails to sustain post-earnings move past day-2 close.
- Sector: Consumer beauty/personal care
- Target: +20% (R:R 2:1)
- Order ID: eeea0b61-cab4-4365-8d84-bf521dfce747
- Stop order ID: pending (post-fill)
- Note: ~$2.55 stock, microcap-adjacent. Liquidity risk flagged.

---

## Format reference (do not delete)

### Trade entry format

```
### YYYY-MM-DD HH:MM — BUY/SELL SYMBOL
- Side: buy | sell
- Shares: N
- Entry price: $X.XX  (or Exit price: $X.XX for sells)
- Stop level: $X.XX (10% trailing GTC)
- Position size: $X (X% of $10k working cap)
- Catalyst: [one-line; cite source from today's RESEARCH-LOG]
- Catalyst type: earnings | guidance | contract | regulatory | macro | sector_rotation
- Sector: [sector]
- Target: $X.XX  (R:R X:1)
- Falsification: [specific observable event that invalidates thesis]
- Direction: bullish | bearish
- Materiality: 0.X — [one-line justification]
- Horizon: N trading days
- Order ID: <alpaca-order-id>
- Stop order ID: <alpaca-stop-order-id>
```

### Trade close + calibration format

Append this block whenever a position closes (stop hit, manual cut,
thesis break, target hit, or end-of-horizon close). Reference the
original entry by date.

```
### YYYY-MM-DD HH:MM — CLOSE SYMBOL (entry: YYYY-MM-DD)
- Exit reason: stop_hit | seven_pct_cut | thesis_break | target | horizon_end
- Exit price: $X.XX
- Realized P&L: $X (X%)
- Days held: N
- Calibration:
  - Predicted direction: bullish | bearish
  - Predicted materiality: 0.X
  - Move from entry to exit: +/-X% (close-to-close)
  - Hit: yes | no
  - Notes: [one line on why the call was right/wrong]
```

For options, add to the close block:
- DTE at exit
- IV at exit (vs IV at entry)

### EOD snapshot format

```
## MMM DD — EOD Snapshot (Day N, Weekday)
**Portfolio:** $X | **Cash:** $X (X%) | **Day P&L:** ±$X (±X%) | **Phase P&L:** ±$X (±X%)

| Ticker | Shares | Entry | Close | Day Chg | Unrealized P&L | Stop |
|--------|--------|-------|-------|---------|----------------|------|

**Notes:** one-paragraph plain-english summary.
```

### 2026-05-06 10:36 -03 — STOPS PLACED (background script)

10% trailing-stop GTC sell orders submitted for QLYS, QRVO, COTY.
Full broker responses: /tmp/stops-results-20260506-103616.json
Script log: /tmp/place-stops-20260506-081911.log

Stop order IDs and confirmation must be reconciled into per-trade entries
above on next session (review /tmp/stops-results-20260506-103616.json for order IDs).

---

## Jun 10 — EOD Snapshot HALTED (Day 41, Wednesday)
**REASON:** ALPACA_API_KEY, ALPACA_SECRET_KEY, ALPACA_ENDPOINT, ALPACA_DATA_ENDPOINT not set in session environment. Alpaca wrapper exited with "ALPACA_API_KEY not set in environment". No portfolio data pulled. No metrics computed.
**Action required:** Re-run /daily-summary after setting env vars in session.

---

## Jun 11 — EOD Snapshot HALTED (Day 42, Thursday)
**REASON:** ALPACA_API_KEY not set in session environment (same as Day 41). Alpaca wrapper exited with "ALPACA_API_KEY not set in environment". No portfolio data pulled. No metrics computed.
**Action required:** Configure ALPACA_API_KEY, ALPACA_SECRET_KEY, ALPACA_ENDPOINT, ALPACA_DATA_ENDPOINT as environment variables in the cloud session (or via .env file locally). Then re-run /daily-summary.

---

## Jun 12 — Market-Open HALTED (Day 44, Friday)
**REASON:** All 5 required env vars MISSING: ALPACA_API_KEY, ALPACA_SECRET_KEY, ALPACA_ENDPOINT, ALPACA_DATA_ENDPOINT, SLACK_WEBHOOK_URL. No broker calls possible. Slack notification not sent. Zero orders placed.

**Pending actions blocked (Day 44 — 4th consecutive session lost):**
1. SELL QRVO 19sh — thesis broken (merger arb; FTC+SAMR binary; CEO insider sale; no organic thesis). Est P&L +12–15%. Priority #1.
2. TIGHTEN QLYS stop — cancel current 10% trailing GTC, replace with 5% GTC. Mandatory: +20% threshold crossed ~June 5. Est HWM $111.80 → 5% stop = ~$106.21. Every day of delay = ~$5.59/share of avoidable downside.
3. CONFIRM COTY — trailing stop at ~$2.42 should have auto-executed when stock dropped to ~$2.03–$2.06. Confirm closed; if still open, sell 784sh.
4. BUY NOW — ServiceNow at $103.08, IN ENTRY ZONE ($100–$112). Materiality 0.65. 10 shares ~$1,030. Gate: requires QRVO/COTY confirmed closed first (deployment math: $1,729 QLYS + $1,000 NOW = $2,729 under $3k cap).

**Action required:** Set ALPACA_API_KEY, ALPACA_SECRET_KEY, ALPACA_ENDPOINT=https://paper-api.alpaca.markets/v2, ALPACA_DATA_ENDPOINT, SLACK_WEBHOOK_URL as environment variables on the cloud session (Settings → Environment Variables). Then re-run /market-open.

---

## Jun 12 — EOD Snapshot HALTED (Day 44, Friday)
**REASON:** All 5 required env vars MISSING (ALPACA_API_KEY, ALPACA_SECRET_KEY, ALPACA_ENDPOINT, ALPACA_DATA_ENDPOINT, SLACK_WEBHOOK_URL). 5th consecutive halted session (Day 41–44 + today's EOD). No broker calls possible; no portfolio data pulled; no metrics computed. Slack fallback written to DAILY-SUMMARY.md.

**Last known portfolio state (Day 0 baseline — no confirmed fills ever logged):**
- Equity: $10,000 (baseline; actual unknown)
- Open positions: QLYS 19sh, QRVO 19sh, COTY 784sh (all entered ~2026-05-06; no fill prices confirmed)
- Day P&L: unknown | Phase P&L: unknown

**Pending actions (5th day blocked — CRITICAL):**
1. SELL QRVO 19sh — thesis broken. Priority #1.
2. TIGHTEN QLYS stop 10% → 5% GTC. HWM est $111.80 → stop ~$106.21. Mandatory since +20% crossed ~Jun 5.
3. CONFIRM COTY — stop should have auto-hit at ~$2.42 when stock fell to ~$2.03–$2.06. Verify closed or sell 784sh.
4. BUY NOW (ServiceNow) — entry zone $100–$112 — gate: QRVO/COTY must close first.

**Action required (URGENT):** Configure env vars in cloud session → Settings → Environment Variables:
- ALPACA_API_KEY, ALPACA_SECRET_KEY, ALPACA_ENDPOINT=https://paper-api.alpaca.markets/v2, ALPACA_DATA_ENDPOINT, SLACK_WEBHOOK_URL
Then re-run /market-open immediately (even if post-market — needed to confirm stops and pending sells). Tomorrow pre-market: verify QRVO exit and QLYS stop tighten before open.

---

## Jun 15 — Market-Open HALTED (Day 45, Monday)
**REASON:** All Alpaca env vars MISSING for the 6th consecutive session. ALPACA_API_KEY, ALPACA_SECRET_KEY, ALPACA_ENDPOINT, ALPACA_DATA_ENDPOINT, SLACK_WEBHOOK_URL all absent from process environment. Zero broker calls possible. Zero orders placed. Slack fallback written to DAILY-SUMMARY.md.

**Pending actions (CRITICAL — growing risk every day):**
1. SELL QRVO 19sh — thesis broken since at least Jun 10. Every session of delay risks giving back gains. Priority #1.
2. TIGHTEN QLYS stop 10% → 5% GTC. Mandatory since +20% crossed ~Jun 5. Est ~$5.59/share of unprotected downside per day above 5% stop.
3. CONFIRM COTY closed — trailing stop should have auto-hit when stock fell to ~$2.03–$2.06. Verify or sell 784sh manually.
4. BUY NOW (ServiceNow) — gated on QRVO/COTY resolved. Entry zone $100–$112 may not hold indefinitely.

**Action required:** Set 5 env vars in cloud session Settings → Environment Variables:
- ALPACA_API_KEY, ALPACA_SECRET_KEY, ALPACA_ENDPOINT=https://paper-api.alpaca.markets/v2, ALPACA_DATA_ENDPOINT, SLACK_WEBHOOK_URL
Then re-run /market-open.

---

## Jun 15 — Midday Scan HALTED (Day 45, Monday)
**REASON:** All 5 env vars MISSING: ALPACA_API_KEY, ALPACA_SECRET_KEY, ALPACA_ENDPOINT, ALPACA_DATA_ENDPOINT, SLACK_WEBHOOK_URL. Guardrail fired: ALPACA_ENDPOINT not set → does not contain "paper-api". Zero broker calls possible. 7th consecutive halted session (Day 41–45).

**Pending actions (CRITICAL — FOMC tomorrow June 16–17 adds urgency):**
1. CONFIRM COTY — trailing stop at ~$2.42 should have auto-hit when stock dropped to ~$2.03–$2.06 weeks ago. Verify closed; if still open, SELL 784sh immediately.
2. SELL QRVO 19sh — thesis broken (merger arb binary; no organic catalyst). ~$106.43 last known. Day 47+ delay unacceptable.
3. TIGHTEN QLYS stop 10% → 5% GTC — mandatory since +20% crossed ~Jun 5. HWM est $111.80 → 5% stop = ~$106.21. Each day = ~$5.59/sh unprotected.
4. POST-FOMC (Wed June 18): Enter VRT $295–315 (Iran deal; materiality 0.75); Enter NOW $100–112 (materiality 0.65); MRVL $275–290 conditional (cap permitting).

**Action required (CRITICAL — 7th session blocked):** Set env vars in cloud session Settings → Environment Variables:
- ALPACA_API_KEY, ALPACA_SECRET_KEY, ALPACA_ENDPOINT=https://paper-api.alpaca.markets/v2, ALPACA_DATA_ENDPOINT, SLACK_WEBHOOK_URL

---

## Jun 15 — EOD Snapshot HALTED (Day 45, Monday)
**REASON:** All 5 env vars MISSING for the 8th consecutive halted workflow. ALPACA_API_KEY, ALPACA_SECRET_KEY, ALPACA_ENDPOINT, ALPACA_DATA_ENDPOINT, SLACK_WEBHOOK_URL all absent from process environment. Paper-API guardrail fired (ALPACA_ENDPOINT blank → does not contain "paper-api"). Zero broker calls possible. No portfolio data pulled. No metrics computed. Slack fallback written to DAILY-SUMMARY.md.

**Last known portfolio state (Day 0 baseline — no broker data since launch):**
- Equity: $10,000 (baseline; actual unknown — no broker data confirmed since Day 0)
- Open positions: QLYS 19sh, QRVO 19sh, COTY 784sh (entered ~2026-05-06; fill prices unconfirmed)
- Day P&L: unknown | Phase P&L: unknown

**Pending actions (CRITICAL — 8th blocked session, FOMC tomorrow Jun 16–17):**
1. CONFIRM COTY — trailing stop at ~$2.42 should have auto-hit when stock fell to ~$2.03–$2.06 weeks ago. Verify closed; if still open, SELL 784sh immediately.
2. SELL QRVO 19sh — thesis broken (merger arb binary; no organic catalyst). Priority #1.
3. TIGHTEN QLYS stop 10% → 5% GTC — mandatory since +20% crossed ~Jun 5. HWM est $111.80 → 5% stop = ~$106.21. Each session of delay = ~$5.59/sh of unprotected downside.
4. POST-FOMC (Wed Jun 18+): Enter VRT $295–315 (materiality 0.75); Enter NOW $100–112 (materiality 0.65); MRVL $275–290 conditional (deployment cap permitting).

**Action required (CRITICAL — 8th halted session):** Set env vars in cloud session Settings → Environment Variables:
- ALPACA_API_KEY, ALPACA_SECRET_KEY, ALPACA_ENDPOINT=https://paper-api.alpaca.markets/v2, ALPACA_DATA_ENDPOINT, SLACK_WEBHOOK_URL
Then re-run /market-open immediately to execute pending sells/stops before FOMC tomorrow.

---

## Jun 16 — EOD Snapshot HALTED (Day 46, Tuesday — FOMC Day 1)
**REASON:** All 5 env vars MISSING for the 9th consecutive halted workflow. ALPACA_API_KEY, ALPACA_SECRET_KEY, ALPACA_ENDPOINT, ALPACA_DATA_ENDPOINT, SLACK_WEBHOOK_URL all absent from process environment. Paper-API guardrail fired (ALPACA_ENDPOINT blank → does not contain "paper-api"). Zero broker calls possible. No portfolio data pulled. No metrics computed. Slack alert not sendable (SLACK_WEBHOOK_URL also missing).

**Context:** Today is FOMC Day 1 (Jun 16–17 meeting). Rate decision tomorrow Jun 17. High market-moving risk. Critical that pending actions execute before/after decision.

**Last known portfolio state (Day 0 baseline — no broker data since launch):**
- Equity: $10,000 (baseline; actual unknown — no broker data confirmed since Day 0)
- Open positions: QLYS 19sh, QRVO 19sh, COTY 784sh (entered ~2026-05-06; fill prices unconfirmed)
- Day P&L: unknown | Phase P&L: unknown

**Pending actions (CRITICAL — 9th blocked session, FOMC decision tomorrow Jun 17):**
1. CONFIRM COTY — trailing stop at ~$2.42 should have auto-hit when stock fell to ~$2.03–$2.06 weeks ago. Verify closed; if still open, SELL 784sh immediately.
2. SELL QRVO 19sh — thesis broken (merger arb binary; no organic catalyst). ~$106.43 last known. Priority #1.
3. TIGHTEN QLYS stop 10% → 5% GTC — mandatory since +20% crossed ~Jun 5. HWM est $111.80 → 5% stop = ~$106.21. Each session of delay = ~$5.59/sh of unprotected downside.
4. POST-FOMC (Jun 17+): Enter VRT $295–315 (materiality 0.75); Enter NOW $100–112 (materiality 0.65); MRVL $275–290 conditional (deployment cap permitting).

**Action required (CRITICAL — 9th halted session, FOMC risk):** Set env vars in cloud session Settings → Environment Variables:
- ALPACA_API_KEY, ALPACA_SECRET_KEY, ALPACA_ENDPOINT=https://paper-api.alpaca.markets/v2, ALPACA_DATA_ENDPOINT, SLACK_WEBHOOK_URL
Then re-run /market-open BEFORE market open tomorrow (Jun 17) — FOMC decision day adds urgency.

---

## Jun 17 — Market-Open HALTED (Day 47, Wednesday — FOMC Decision Day)
**REASON:** All 5 env vars MISSING for the 10th consecutive halted session. ALPACA_API_KEY, ALPACA_SECRET_KEY, ALPACA_ENDPOINT, ALPACA_DATA_ENDPOINT, SLACK_WEBHOOK_URL all absent from process environment. Paper-API guardrail fired (ALPACA_ENDPOINT blank → does not contain "paper-api"). Zero broker calls possible. No portfolio data pulled. No metrics computed.

**Context:** Today is FOMC Decision Day (rate announcement ~2pm ET). This is the highest-risk market session of the month. Open positions QLYS/QRVO/COTY are exposed with no management possible. 10 consecutive sessions (Day 41–47) with zero broker access.

**Last known portfolio state (Day 0 baseline — no broker data since launch):**
- Equity: $10,000 (baseline; actual unknown — no broker data confirmed since Day 0)
- Open positions: QLYS 19sh, QRVO 19sh, COTY 784sh (entered ~2026-05-06; fill prices unconfirmed)
- Day P&L: unknown | Phase P&L: unknown

**Pending actions (CRITICAL — 10th blocked session, FOMC rate decision today):**
1. CONFIRM COTY — trailing stop at ~$2.42 should have auto-hit when stock fell to ~$2.03–$2.06 weeks ago. Verify closed; if still open, SELL 784sh immediately.
2. SELL QRVO 19sh — thesis broken (merger arb binary; no organic catalyst). Priority #1.
3. TIGHTEN QLYS stop 10% → 5% GTC — mandatory since +20% crossed ~Jun 5. HWM est $111.80 → 5% stop = ~$106.21. Each session of delay = ~$5.59/sh of unprotected downside.
4. POST-FOMC: Enter VRT $295–315 (materiality 0.75); Enter NOW $100–112 (materiality 0.65); MRVL $275–290 conditional (deployment cap permitting).

**Action required (CRITICAL — 10th halted session, FOMC today):** Set env vars in cloud session Settings → Environment Variables:
- ALPACA_API_KEY, ALPACA_SECRET_KEY, ALPACA_ENDPOINT=https://paper-api.alpaca.markets/v2, ALPACA_DATA_ENDPOINT, SLACK_WEBHOOK_URL
Then re-run /market-open immediately — FOMC rate decision is TODAY ~2pm ET.
