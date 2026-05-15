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

---

## Week ending 2026-05-15

### Stats — Stock Book
| Metric | Value |
|--------|-------|
| Starting portfolio | ~$10,091 (est.; corrected from May 8 close data vs prior $9,955 estimate) |
| Ending portfolio | ~$9,720 (est.) |
| Week return | ~-$371 (-3.7%) |
| S&P 500 week | +0.3% (247WallSt / TheStreet 2026-05-15; S&P record 7,501 Thu; Fri pullback -1.1%) |
| Bot vs S&P | -4.0% |
| Phase return (since Apr 30) | ~-$280 (-2.8%) vs S&P est. +2.6% = **-5.4% relative** |
| Stock trades | 0 opens, 0 closes (W:0 / L:0 / open:3) |
| Win rate | N/A — no closed trades |
| Best unrealized | QRVO -0.2% (est.) |
| Worst unrealized | QLYS -4.7% (est.; intraday low $84.63 = $0.01 from -7% hard cut) |
| Profit factor | N/A — no closed trades |

*All prices estimated — Alpaca API offline all week (env vars unset, 9th consecutive session). Based on WebSearch price estimates from May 11–15 research log entries.*

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

*No calibrated trades placed in either week 1 or week 2. QLYS, QRVO, COTY remain pre-calibration entries (excluded per §Pre-calibration trades). First eligible calibrated trade requires API restore + deployment room.*

### Closed Trades
None this week.

### Open Positions at Week End
| Ticker | Entry | Last (est.) | Unrealized | Stop | Notes |
|--------|-------|-------------|------------|------|-------|
| QLYS | $90.99 (05-06) | ~$86.73 | -4.7% / -$81 | ~$81.89 | ⚠⚠ Intraday low $84.63 = $0.01 from -7% hard cut; falsification ($85.50) likely breached Fri close |
| QRVO | $89.66 (05-06) | ~$89.50 | -0.2% / -$3 | $80.56 | Thesis broken (merger arb); FTC Second Request; voluntary exit Day 9 pending |
| COTY | $2.50 (05-06) | ~$2.25 (est.) | ~-10% / ~-$196 | ~$2.25 | **Thesis broken Day 9** — class action deadline May 22; hard stop may have triggered |

### What Worked
- Research quality strong: April CPI (+3.7%), PPI surprise (+1.4%), Iran/Hormuz escalation, Japan PPI Friday spike all identified and risk-framed before market reaction
- VRT thesis fully developed (materiality 0.85, full entry checklist, entry zone $360–$380) — entry-ready the moment API is restored
- CRWD and DDOG pullback discipline held — neither chased despite extended moves (CRWD $576 vs $495–510 zone; DDOG $203 vs $183–195 zone)
- QLYS hard-cut and falsification thresholds tracked daily; intraday $84.63 breach flagged in May 15 pre-market before it occurred
- Trump-Xi summit outcome (limited deal, risk-on moderate) correctly anticipated; no overtrading on the event

### What Didn't Work
- API offline for the ENTIRE second week (9 consecutive sessions) — same failure as week 1 despite "restore API" being lesson #1
- COTY broken-thesis sell pending 9 calendar days; class action deadline now 7 days away
- QRVO voluntary exit blocked all week; FTC Second Request added adverse regulatory risk mid-week with no response possible
- QLYS touched -7% hard cut intraday ($84.63 vs $84.62 cut) with zero capacity to execute mandatory sell
- Zero calibrated trades in two full weeks — the calibration engine has produced no learning data; the experiment's primary objective is stalled

### Key Lessons
- **Week 2 API failure is a process failure, not a technical glitch.** The lesson was documented in week 1 and not acted on. Env vars must be persisted in the execution environment before each session, not treated as a known-but-deferred fix.
- **Three simultaneous broken-thesis exits** (COTY, QRVO, QLYS probable) will require immediate multi-order execution at Monday open — pre-plan the order sequence.
- **QLYS near hard cut + below all analyst floor targets** signals the post-earnings momentum thesis has failed regardless of whether the stop formally triggers. Voluntary exit alongside COTY/QRVO should be evaluated on Monday.
- **COTY class action deadline (May 22)** converts a broken-thesis hold into a time-limited liability. Every additional day of delay is now compounding, not just violating strategy rules.
- **VRT must be entered as soon as deployment room opens.** Two weeks of zero calibrated trades means the calibration engine has nothing to learn from. This is the primary failure of the experiment to date.

### Adjustments for Next Week
None — framework freeze in effect through 2026-05-22 (lifted at next weekly review).

Operational priorities (not strategy changes):
1. **Restore env vars before Monday open** — mandatory; Day 9 is unacceptable; Day 10 is a process breakdown
2. **SELL COTY 784sh at Mon open** — Day 9 broken thesis; class action May 22; `/trade COTY 784 sell`
3. **SELL QRVO 19sh at Mon open** — thesis broken (merger arb); `/trade QRVO 19 sell`
4. **Evaluate QLYS Mon AM:** ≤ $84.62 → hard cut → sell; $84.62–$85.50 → falsification fired → sell; > $85.50 → hold and re-evaluate thesis
5. **Enter VRT $360–$380** once COTY + QRVO clear; materiality 0.85; best-qualified thesis in universe
6. **Framework freeze ends May 22** — universe review, QLYS/QRVO/COTY post-mortem, and first calibrated-trade cohort evaluation eligible at next weekly review

### Overall Grade: D

Rationale: Second consecutive week of complete API paralysis despite explicit week 1 lesson. COTY broken-thesis sell 9 days overdue; QLYS briefly hit the mandatory -7% hard cut with zero response capacity; QRVO voluntary exit deferred for 9 sessions. Zero calibrated trades in 2 full weeks — the core learning objective has stalled. Research quality remains A-grade; execution is F; combined D. S&P 500 +0.3% this week vs bot -3.7%; cumulative phase: S&P ~+2.6%, bot ~-2.8% (-5.4% relative).
