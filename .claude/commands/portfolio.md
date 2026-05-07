---
description: Read-only snapshot of account, positions, open orders, and stops
---

Print a clean ad-hoc snapshot. No state changes, no orders, no file writes.

1. `bash scripts/alpaca.sh account`
2. `bash scripts/alpaca.sh positions` (returns both stocks and options)
3. `bash scripts/alpaca.sh orders`

Split positions by `asset_class`: `us_equity` → stock book, `us_option` → options sleeve.

Format the output as a single concise summary. Working cap is $10k; report
deployed % against that, NOT against Alpaca account equity.

```
Portfolio — <today's date>
Working cap: $10,000 | Account equity: $X (Alpaca paper, ignore for sizing)
Cash: $X | Daytrade count: N/4

Stock book (cap $3,000 = 30% of $10k):
  SYM | Sh | Entry -> Now | Unrealized P&L | Stop
  Deployed: $X (X% of $10k working cap)

Options sleeve (cap $500 = 5% of $10k):
  CONTRACT | Qty | Entry premium -> Now | P&L | DTE | Δ
  Sleeve used: $X premium / $500

Open orders:
  TYPE | SYM | qty | trail/stop | order_id
```

Flag anything broken: stock without a stop, stop below current price,
options sleeve over $500, option position under 21 DTE (must close).
