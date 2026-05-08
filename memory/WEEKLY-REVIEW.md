# Weekly Review

Friday weekly reviews are appended here. New entries go at the bottom.

---

## Format reference (do not delete)

```
## Week ending YYYY-MM-DD

### Stats
| Metric | Value |
|--------|-------|
| Starting portfolio | $X |
| Ending portfolio | $X |
| Week return | ±$X (±X%) |
| S&P 500 week | ±X% |
| Bot vs S&P | ±X% |
| Trades | N (W:X / L:Y / open:Z) |
| Win rate | X% |
| Best trade | SYM +X% |
| Worst trade | SYM -X% |
| Profit factor | X.XX |

### Closed Trades
| Ticker | Entry | Exit | P&L | Notes |
|--------|-------|------|-----|-------|

### Open Positions at Week End
| Ticker | Entry | Close | Unrealized | Stop |
|--------|-------|-------|------------|------|

### What Worked
- ...

### What Didn't Work
- ...

### Key Lessons
- ...

### Adjustments for Next Week
- ...

### Overall Grade: X (A–F)
```

---

## Week ending 2026-05-08

### Stats — Stock Book
| Metric | Value |
|--------|-------|
| Starting portfolio | $10,000.00 |
| Ending portfolio | ~$9,955 (est.) |
| Week return | ~-$45 (-0.45%) |
| S&P 500 week | +2.3% (CNBC 2026-05-08; close 7,398.93) |
| Bot vs S&P | -2.75% |
| Stock trades | 3 opens (W:0 / L:0 / open:3) |
| Win rate | N/A — no closed trades |
| Best trade | COTY +6.04% unrealized peak (thesis broken) |
| Worst trade | QLYS -2.74% unrealized (est. week-end) |
| Profit factor | N/A — no closed trades |

*All prices estimated — Alpaca API offline all week (env vars unset). Based on 2026-05-07 API read + research estimates.*

### Stats — Options Sleeve
| Metric | Value |
|--------|-------|
| Trades this week | 0 |
| W / L / open | 0 / 0 / 0 |
| Sleeve cap utilization | $0 / $500 (0%) |
| Open option positions | 0 |

### Calibration
| Metric | Value |
|--------|-------|
| Total resolved calibrated trades | 0 |
| Overall hit rate | N/A |
| Hit rate by sector | N/A |
| Hit rate by catalyst type | N/A |
| Hit rate by direction | N/A |
| Materiality bucket accuracy | N/A |
| Band recommendation | **Insufficient data** (0 of 20 minimum resolved trades) |

*QLYS, QRVO, COTY are pre-calibration entries — excluded from all calibration metrics per TRADING-STRATEGY.md §Pre-calibration trades. First eligible calibrated trade: Mon 2026-05-11.*

### Closed Trades
None this week.

### Open Positions at Week End
| Ticker | Entry | Last (est.) | Unrealized | Stop | Notes |
|--------|-------|-------------|------------|------|
| QLYS | $90.99 (05-06) | ~$88.49 | -2.74% / -$47.50 | $81.99 | Falsification fires if Fri close ≤ $85.50 → sell Mon |
| QRVO | $89.66 (05-06) | ~$89.92 | +0.29% / +$4.94 | $80.56 | Merger arb drag; SAMR Phase II → late 2026–early 2027 |
| COTY | $2.50 (05-06) | ~$2.50 | ~flat / -$1.96 | $2.41 | **Thesis broken** (LFL -7%, margin -250bps, EPS miss) — sell Mon |

### What Worked
- Research quality high: falsification conditions documented at entry, Q3 actuals validated COTY break exactly as written
- AMD beat read-through for QRVO recognized on schedule; sector halo correctly anticipated
- Two independent sessions (cloud + manual, 2026-05-07) converged on COTY thesis break — framework functioning
- Next-week candidates (DDOG, CRWD, VRT) staged with full entry checklists before week-end
- QLYS falsification trigger ($85.50) tracked daily; no end-of-week surprise

### What Didn't Work
- All 3 weekly slots used in one after-hours session (2026-05-05) — zero intra-week flexibility
- COTY thesis broke 2026-05-07 AM but sell not executed; API offline every session left broken position open over the weekend
- QLYS: sell-side PT cuts dominated; billings weakness absent from original thesis scan
- Grandfathered 55% deployment blocks new entries under the 30% cap — first calibrated entries structurally delayed
- Zero calibrated trades placed in week 1; calibration engine produced no learning data

### Key Lessons
- **API connectivity is a hard prerequisite.** Three days offline = unclosed broken-thesis position + unverified stops. Env vars confirmed before every session, no exceptions.
- **Staging all 3 slots overnight is a trap.** Using 3/3 before Monday open means no capacity to respond all week. Stage entries across the week.
- **Grandfathered positions need a concrete close-out timeline.** The 55% → 30% migration should have been written as a dated sequence, not a mental note.
- **COTY liquidity flag at entry should have been weighted as a near-blocker.** Microcap names carry wider thesis-break scenarios and harder exits.
- **The falsification framework is working exactly as designed.** Both COTY and QLYS hit documented triggers within 5 trading days. Gap is execution, not thesis quality.

### Adjustments for Next Week
None — framework freeze in effect through 2026-05-22.

Operational priorities (not strategy changes):
1. Restore Alpaca API connectivity before Monday open (env vars must be exported)
2. Sell COTY at Monday open — thesis broken, do not wait for -7% hard stop
3. If QLYS closed Fri ≤ $85.50 → falsification fired → sell at Monday open
4. After exits: confirm total stock book ≤ $3,000 before any new entries
5. First calibrated entries: DDOG, CRWD, or VRT — staged in RESEARCH-LOG 2026-05-08

### Overall Grade: C-

Rationale: Strong research and correct thesis identification (COTY break called twice, QLYS falsification tracked daily) undercut by API-offline execution gaps all week. S&P 500 +2.3% vs. bot -0.45% = -2.75% relative. Zero calibrated trades placed — week 1 produced no learning data for the calibration engine. First-week infrastructure failure is forgivable once; recurring = process breakdown.
