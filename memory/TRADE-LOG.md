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
- Position size: $X (X% of equity)
- Catalyst: [one-line; cite source from today's RESEARCH-LOG]
- Sector: [sector]
- Target: $X.XX  (R:R X:1)
- Order ID: <alpaca-order-id>
- Stop order ID: <alpaca-stop-order-id>
```

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
