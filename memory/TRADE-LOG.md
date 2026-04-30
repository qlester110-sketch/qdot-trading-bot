# Trade Log

All trades and end-of-day snapshots are appended here in chronological
order. New entries go at the bottom. Format examples appear under the
Day 0 baseline below.

---

## Day 0 — EOD Snapshot (2026-04-30, pre-launch baseline)

**Portfolio:** $10,000.00 | **Cash:** $10,000.00 (100%) | **Day P&L:** $0 | **Phase P&L:** $0

No positions yet. Bot launches on the next trading day.

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
