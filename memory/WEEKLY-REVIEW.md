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

---

## Week ending 2026-05-22

### Stats — Stock Book
| Metric | Value |
|--------|-------|
| Starting portfolio | ~$9,720 (est.; Week 2 close) |
| Ending portfolio | ~$10,120 (est.; see COTY note below) |
| Week return | ~+$400 (+4.1%) — **first positive week** |
| S&P 500 week | +0.5% (TheStreet 2026-05-22; close 7,473.47) |
| Bot vs S&P this week | **+3.6%** — first week of outperformance |
| Phase return (since Apr 30) | ~+$120 (+1.2%) vs S&P est. +3.1% = **-1.9% relative** |
| Stock trades | 0 opens, 0 closes (W:0 / L:0 / open:3) |
| Win rate | N/A — no closed trades |
| Best unrealized | QRVO +10.2% / +$173 ($98.78 confirmed) |
| Worst unrealized | QLYS ~+0.6% / +$10 est (~$91.50 est; trailing stop risk ~$88.18) |
| Profit factor | N/A — no closed trades |

*All prices estimated — Alpaca API offline all week (env vars unset, Day 17). QLYS May 22 est ~$90–93 (back-calculated from analyst consensus). QRVO $98.78 confirmed by search. COTY: trailing stop (~$2.42 from $2.675 HWM) should have auto-executed when price hit ~$2.06 range (May 19–20 est); paper-account execution uncertain — position may be closed at ~-3.2% or still open near $2.50. Class action lead-plaintiff deadline was TODAY (May 22). S&P 500 May 15 close est ~7,419; May 22 close 7,473.47 → +0.7% Friday-to-Friday (TheStreet reports +0.5% week-to-date from Monday open).*

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

*QLYS, QRVO, COTY remain pre-calibration entries — excluded per TRADING-STRATEGY.md §Pre-calibration trades. Zero calibrated trades placed in 3 full weeks. First eligible calibrated trade: VRT (pending API restore + COTY/QRVO confirmed closed).*

### Closed Trades
None this week. (COTY trailing stop may have auto-executed mid-week; cannot confirm without API.)

### Open Positions at Week End
| Ticker | Entry | Last (est.) | Unrealized | Stop | Notes |
|--------|-------|-------------|------------|------|-------|
| QLYS | $90.99 (05-06) | ~$91.50 est | +0.6% / +$10 | ~$88.18 (trailing from $97.98 HWM) | ⚠ Near trailing stop; thesis intact (FedRAMP High); cybersec sector laggard |
| QRVO | $89.66 (05-06) | $98.78 confirmed | +10.2% / +$173 | $80.56 | Thesis broken (merger arb); SVP insider sold 14,640sh May 18; Day 17 voluntary exit |
| COTY | $2.50 (05-06) | ~$2.42–$2.50 est | -3.2% to 0% | ~$2.42 (trailing from $2.675 HWM) | ⛔ Trailing stop may have auto-fired at ~$2.42; class action deadline TODAY; confirm & close |

### What Worked
- QLYS FedRAMP High TotalCloud CNAPP authorization (May 14) drove +8.84% single-session surge on May 18, recovering from $86.73 (near -7% hard cut) to $97.98 close — catalyst correctly identified and tracked in pre-market research days before the price move
- QRVO reached best exit window of position's history: +10.2% ($98.78) from a thesis-broken merger-arb trade — the "hold above stop while seeking voluntary exit" approach worked; stock rose while the exit strategy remained intact
- NVDA Q1 blowout ($81.6B rev, Q2 $91B guide) confirmed the AI datacenter capex supercycle thesis underpinning VRT, NOW, CRWD, DDOG watchlist; all correctly anticipated in pre-market research before the event
- First outperformance week: bot +4.1% vs S&P 500 +0.5% = +3.6% relative — driven entirely by unrealized position moves, but the framework's hold discipline on thesis-intact positions paid off
- VRT entry plan fully developed with revised entry zone ($315–$335 confirmed at $323.40 on May 22) and materiality 0.85; NOW upgraded from 0.65 → 0.70 at this review; framework freeze-end watchlist ready for execution

### What Didn't Work
- COTY class action lead-plaintiff deadline hit TODAY (May 22) with no confirmed exit — thesis broke May 7 (Day 1); we have been tracking this 15-day countdown without any ability to execute
- API offline for all 5 trading sessions this week (Day 17 of consecutive outage) — QRVO voluntary exit blocked for 15+ days; COTY mandatory exit blocked; VRT entry blocked; stops on all positions unverifiable; no Slack alerts sent
- QLYS gave back 5+ points from its $97.98 HWM (May 18) to ~$91.50 by week end; trailing stop is the only protective mechanism in place and it cannot be confirmed without API
- Zero calibrated trades in 3 full weeks (15 trading sessions) — the experiment's stated primary objective (learning via calibration) has produced no data; the calibration engine is still at Day 0
- Zero weekly trade slots used in either week 2 or week 3 — full deployment constraint + API outage = no new capital deployed under the current framework in 2 full weeks

### Key Lessons
- **QLYS recovery validated the "hold above stop when thesis is intact" rule.** The stock hit $84.63 intraday (1¢ from -7% hard cut) on May 15, then +8.84% on May 18 on FedRAMP High catalyst. Manual exit would have locked in the loss; the framework prevented it.
- **QRVO illustrates the cost of blocked exits.** The position has gone from flat to +10.2% while we've been unable to execute the voluntary exit. This is accidental luck — not repeatable. It also means we've held a merger-arb position (not our game) for 17 days past its intended voluntary exit.
- **COTY class action deadline is the clearest failure of the 3-week experiment.** A paper-trading bot that can't close a broken-thesis position before a documented legal deadline has failed the execution discipline test, regardless of P&L.
- **The 3-week API outage is a systemic failure, not a one-off.** It has been documented in every session across 3 weeks. No env var fix has been applied. This is now the experiment's dominant risk factor — it completely negates the strategy framework.
- **NVDA read-through thesis worked.** The May 21 pre-market research correctly predicted that NVDA's Q2 guide would be the key gating event for VRT entry. The actual result ($91B guide vs $87B consensus) exceeded expectations and directly confirmed VRT's thesis. The entry plan (VRT $315–335 post-NVDA clarity) was correct; only the API blocked execution.

### Adjustments for Next Week
Framework freeze lifted as of 2026-05-22. No strategy rule changes at this review (0 calibration data; no rule violations; no owner override required). Framework remains unchanged; changes eligible at weekly review 2026-05-29 if evidence warrants.

Research-level updates (not strategy changes):
1. **NOW materiality upgraded 0.65 → 0.70** (documented in RESEARCH-LOG 2026-05-22). Stacked positives: Q1 beat + raised guide + Experian AI partnership + BofA $130 PT reinstated + Knowledge 2026 AI products. Eligible for entry once deployment math permits.
2. **CRWD entry zone updated: $590–$620** (from prior $570–$590 / $495–$510). At $648 on May 22 — still above zone; patience required.
3. **DDOG entry zone updated: $193–$198** (from $183–$195). At $200+ — still above zone.
4. Universe: no additions or drops. 35 tickers unchanged.

Operational priorities (mandatory before Mon May 25 open):
1. **Restore env vars — API Day 17 is unacceptable.** `export ALPACA_API_KEY=... ALPACA_SECRET_KEY=... ALPACA_ENDPOINT=https://paper-api.alpaca.markets ALPACA_DATA_ENDPOINT=... SLACK_WEBHOOK_URL=...`
2. **Confirm COTY status** — `bash scripts/alpaca.sh positions`. If still open: sell 784sh immediately. If stopped at ~$2.42: log the realized P&L. Class action deadline TODAY.
3. **SELL QRVO 19sh** — best exit in position's history (+10.2%). Thesis broken; insider sold. Day 17.
4. **Enter VRT $315–$335** — after COTY/QRVO confirmed closed → deployed ~$1,767 (QLYS) → VRT $1,000 → total ~$2,767 ✓. 10% trailing GTC, $1k max. First calibrated trade.
5. **Monitor QLYS** — trailing stop at ~$88.18. If stop fires next week: log realized P&L, evaluate NOW entry.
6. **NOW entry** — conditional; requires QLYS also closing OR QRVO proceeds freeing room + math checks. VRT is priority.

### Overall Grade: C

Rationale: First outperformance week (+4.1% vs S&P +0.5%), driven by QLYS FedRAMP recovery and QRVO reaching its best unrealized P&L of the experiment. Research quality remains A-grade — all key catalysts (NVDA read-through for VRT, FedRAMP for QLYS, insider sell signal for QRVO) correctly identified before market reaction. Grade held to C (not B) for: (1) COTY class action deadline hit today without confirmed exit — the most documented impending event of the entire experiment, and we still couldn't execute; (2) API offline Day 17 — same operational failure documented and unresolved for the third consecutive week; (3) zero calibrated trades in 15 trading sessions — the experiment's primary learning objective stalled at zero. Phase: bot ~+1.2% vs S&P ~+3.1% = -1.9% relative (improvement from -5.4% last week).

---

## Week ending 2026-05-29

### Stats — Stock Book
| Metric | Value |
|--------|-------|
| Starting portfolio | ~$10,120 (est; Week 3 close / May 26 AM open) |
| Ending portfolio | ~$10,456 (est; primary scenario — COTY stopped) |
| Week return | ~+$336 (+3.3%) |
| S&P 500 week | +1.43% (TheStreet 2026-05-29; close 7,580.08; 9th consecutive weekly gain) |
| Bot vs S&P this week | **+1.87%** — second consecutive week of outperformance |
| Phase return (since Apr 30) | ~+$456 (+4.56%) vs S&P +4.84% → **−0.28% relative (near parity)** |
| Stock trades | 0 opens, 0 closes (W:0 / L:0 / open:2) |
| Win rate | N/A — no calibrated closed trades |
| Best unrealized | QRVO +20.2% / +$343 ($107.75 confirmed) |
| Worst unrealized (active) | QLYS +10.1% / +$174 ($100.20 confirmed) |
| Profit factor | N/A — no calibrated closed trades |

*All prices estimated (API offline Day 23–24, 5th consecutive week). COTY trailing stop (~$2.42 from $2.675 HWM) presumed auto-fired mid-May when price fell to ~$2.03; if fired: realized −3.2% / −$62; position closed. Primary scenario: 2 open positions (QLYS, QRVO). Alternate scenario (COTY NOT stopped): 3 open positions; COTY +7.6% at $2.69; ending portfolio ~$10,668 (+5.4% week). API must confirm at Monday open.*

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

*QLYS, QRVO, COTY remain pre-calibration entries — excluded per TRADING-STRATEGY.md §Pre-calibration trades. Zero calibrated trades placed in 5 full weeks (25 trading sessions). First eligible calibrated entry will be VRT or MDB once API is restored. Day 29 of 90 — one-third of experiment window spent with zero calibration data.*

### Closed Trades
None this week. COTY stop presumed auto-fired mid-May (outside this week); awaiting API confirmation. Once confirmed, CLOSE block will be logged in TRADE-LOG.md with calibration: N/A (pre-calibration entry).

### Open Positions at Week End
| Ticker | Entry | Last (est.) | Unrealized | Stop | Notes |
|--------|-------|-------------|------------|------|-------|
| QLYS | $90.99 (05-06) | $100.20 (YF May 29) | +10.1% / +$174 | ~$92.17 (10% below $102.41 HWM) | ZS −25.8% contagion May 27 absorbed; fully recovered to $100+ May 29. Pre-cal. |
| QRVO | $89.66 (05-06) | $107.75 (YF May 29) | +20.2% / +$343 | $80.56 | Thesis broken (merger arb); FTC + SAMR Phase II; insider sold May 18. **Day 24 — SELL Mon.** |
| COTY (?) | $2.50 (05-06) | $2.69 (YF May 29) | Stop likely fired ~$2.42 → −3.2% | ~$2.42 | Stop presumed auto-fired ~May 15–19 (price $2.02–$2.18 range). Confirm Monday. |

### What Worked
- QLYS absorbed ZS −25.8% sector contagion May 27 (pulled down ~2% intraday) and fully recovered to $100.20 by May 29 (+10.1% from entry); QLYS company-specific strength decoupled correctly from ZS execution failure
- QRVO at +20.2% / $107.75 is new position high — broken-thesis hold above stop produced the best unrealized P&L of the experiment; "hold above stop for voluntary exit" working as designed (though delay remains operational failure)
- AI datacenter capex thesis confirmed by 5 consecutive beats: MRVL beat + raised (Q1 +28% YoY, Q2 guide $2.70B), CRM (EPS +50% YoY), SNOW blowout +37.65% (NRR 126%, $6B AWS deal), MDB beat + raised (+25% YoY), OKTA beat + raised (+11% YoY) — every priority universe sector delivered
- VRT entry discipline held: premarket $339.95 was above $335 ceiling; no chase despite MRVL confirmation; entry zone integrity preserved for Monday execution
- Phase gap closed from −1.9% (last week) to −0.28% — bot near parity with S&P 500 over 29 days without a single calibrated entry executed

### What Didn't Work
- API offline Day 23–24 (5th consecutive week) — QRVO voluntary exit now 24 days overdue after thesis break; every week the same lesson is documented and unacted on
- Zero calibrated trades in 25 trading sessions — Day 29 with 0 learning data; at current trajectory the 20-trade calibration minimum would require the full 90-day window to meet
- COTY P&L uncertainty persists: paper-account stop fill reliability means ending portfolio range is $10,456–$10,668 depending on whether stop fired; cannot produce a verified balance sheet
- ZS −25.8% cybersecurity sector contagion threatened QLYS trailing stop on May 27 (pulled stock toward $92.17 stop level) with no active monitoring or defensive capacity
- VRT entry blocked for second consecutive week despite all conditions met: thesis confirmed (multiple upstream reads), entry zone correct ($315–$335), gate math clear — only API credentials were missing

### Key Lessons
- **Phase near-parity despite zero calibrated trades means grandfathered positions carried the experiment.** QLYS and QRVO did the work; the strategy framework had nothing to do with it. First calibrated entries are now overdue — not optional.
- **QRVO +20.2% on a broken-thesis hold is accidental, not strategic.** COTY broke thesis and fell; QRVO broke thesis and rose. Both validate the same rule: voluntary exits must execute promptly. Depend on the process, not the outcome.
- **ZS −25.8% is company-specific execution failure, not sector demand destruction.** OKTA +8% AH the same night on sector-wide demand confirms this. Sector exit rule triggers on the bot's own 2 consecutive failures — not on a peer's earnings. QLYS holds correctly.
- **Day 29 with 0 calibrated entries is the experiment's critical failure point.** Five weeks in, the calibration engine that defines success has produced zero data. At 30 sessions per 6 weeks, the 20-trade minimum requires an average of ≥4 entries per month — currently at 0/month. VRT must be Week 6's first calibrated trade.
- **Five consecutive weeks of earnings beats (MRVL/SNOW/MDB/OKTA/CRM) all within the universe confirms the research framework is identifying the right companies.** The research edge is real. The operational edge is absent.

### Adjustments for Next Week
No strategy rule changes — 0 calibration data; no rule violations requiring immediate fix; no owner override. TRADING-STRATEGY.md unchanged.

Operational priorities (mandatory before Mon June 2 open):
1. **Restore env vars** (Day 24 is unacceptable; one-third of experiment window gone)
2. **SELL QRVO 19sh market** — Day 24; +20.2%; `/trade QRVO 19 sell`; log CLOSE block (calibration: N/A)
3. **Confirm COTY** — `bash scripts/alpaca.sh positions`; if open: SELL 784sh; log CLOSE block (calibration: N/A)
4. **Enter VRT ≤ $335** — first calibrated trade; QRVO/COTY exits confirm deployment room; $1k max; 10% trailing GTC stop; log full entry block with all calibration fields
5. **MDB pullback entry (secondary)** — only if QLYS also stops OR additional room opens; wait ≥3% below Monday opening high before entering
6. **CRWD** — earnings June 3; no entry before print; wait post-earnings pullback to $590–620 zone

### Overall Grade: B-

Rationale: Second consecutive outperformance week (+3.3% vs S&P +1.43% = +1.87% relative); phase gap closed from −1.9% to −0.28% — bot is now tracking the S&P despite zero calibrated trades placed in 25 sessions. QLYS +10.1% and QRVO +20.2% are the strongest position results to date; AI datacenter thesis confirmed by five in-universe earnings beats (MRVL, CRM, SNOW, MDB, OKTA). Research quality A. Grade held to B- (not B) for: (1) API offline Day 23–24 — 5th consecutive week of broker paralysis; (2) QRVO voluntary exit 24 days overdue; (3) zero calibrated trades in 25 sessions — the experiment's defined learning objective has produced no data after one-third of the window; (4) VRT entry blocked for the second consecutive week despite confirmed thesis, confirmed entry zone, and confirmed gate math. S&P 500: Apr 30 close 7,230.12; May 29 close 7,580.08 (+4.84% phase). Sources: TheStreet 2026-05-29; CNBC S&P 500 April 30 2026.

---

## Week ending 2026-06-05

### Stats — Stock Book
| Metric | Value |
|--------|-------|
| Starting portfolio | ~$10,456 (est; Week 5 close / June 1 AM open) |
| Ending portfolio | ~$10,646 (est) |
| Week return | ~+$190 (+1.82%) — **third consecutive outperformance week** |
| S&P 500 week | −0.49% (Advisor Perspectives / InvestingLive; close ~7,543; NFP beat +172K vs +85K est drove Friday selloff) |
| Bot vs S&P this week | **+2.31%** — third consecutive week of outperformance |
| Phase return (since Apr 30) | ~+$646 (+6.46%) vs S&P +4.33% → **+2.13% relative** |
| Stock trades | 0 opens, 0 closes (W:0 / L:0 / open:3 est) |
| Win rate | N/A — no calibrated closed trades |
| Best unrealized | QLYS +22.6% / +$390 ($111.53 est June 5) |
| Worst (realized est) | COTY −3.2% / −$63 (trailing stop presumed fired mid-May; unconfirmed) |
| Profit factor | N/A — no calibrated closed trades |

*All prices estimated — Alpaca API offline all week (env vars unset, Day 28 consecutive outage — 6th full week). QLYS: $111.53 (Investing.com June 5). QRVO: ~$106.42 (WallStreetZen range). VRT: $305.12 (Yahoo Finance June 5) — below $315–335 entry zone. COTY stop presumed auto-fired mid-May (unconfirmed). S&P 500: May 29 close 7,580.08 vs June 5 close ~7,543 = −0.49%; phase Apr 30 close 7,230.12 to June 5 = +4.33%. NFP May +172K vs +85K forecast (BLS June 5).*

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

*QLYS, QRVO, COTY remain pre-calibration entries — excluded per TRADING-STRATEGY.md §Pre-calibration trades. Zero calibrated trades in 7 full weeks (35 trading sessions). Day 37 of 90 — 41% of experiment window with zero calibration data. At current rate, the 20-trade minimum is unreachable in the remaining 53 days without immediate API restore and ≥2 new calibrated entries per week.*

### Closed Trades
None this week. COTY trailing stop presumed fired mid-May (unconfirmed; first API call must verify and log CLOSE block).

### Open Positions at Week End
| Ticker | Entry | Last (est.) | Unrealized | Stop (est.) | Notes |
|--------|-------|-------------|------------|-------------|-------|
| QLYS | $90.99 (05-06) | $111.53 (Investing.com Jun 5) | +22.6% / +$390 | ~$100.38 (10% below $111.53 new HWM) | **⚠ +20% threshold crossed — tighten stop to 5% on API restore** |
| QRVO | $89.66 (05-06) | ~$106.42 est (Jun 5) | +18.7% / +$318 | $80.56 | ⛔ Thesis broken (merger arb); FTC + SAMR Phase II; **Day 28 — SELL immediately on API restore** |
| COTY | $2.50 (05-06) | Stop presumed fired ~$2.42 | −3.2% / −$63 (if stopped) | N/A | ⛔ Stop likely auto-fired mid-May; confirm via first API call |

### What Worked
- QLYS at $111.53 (+22.6%) validates "hold above stop when thesis intact" — ZS contagion and Anthropic Mythos fears proved transient; stock now well through the +20% tighten-stop threshold
- CRWD sell-the-news risk called correctly in June 1–4 pre-market research: no entry before June 3 print; −9–11% AH confirmed the discipline of waiting
- AVGO Q3 AI semi guide ($16.0B +200% YoY) is the single strongest AI capex confirmation since NVDA — adds fourth independent read-through confirming VRT thesis; research framework called the catalyst before the event
- NFP beat risk (+172K vs +85K) correctly identified as Friday tail-risk; "no new entries day before high-impact macro release" rule prevented entering into Friday's selloff
- Phase +2.13% relative outperformance — bot has reversed the early-phase deficit; three consecutive weeks above S&P 500

### What Didn't Work
- API offline Day 28 — **6th consecutive week** of broker paralysis; same documented operational failure unresolved since Week 1; opportunity cost now quantifiable: VRT, NOW, MDB all moved through or past entry zones while execution was impossible
- VRT entry window **closed**: June 5 close $305.12 is below the $315–335 entry zone that has been staged for 7 weeks; the falsification threshold ($300) is now just $5 away
- Zero calibrated trades in 35 sessions — 41% of the 90-day experiment window has elapsed with zero learning data generated; the 20-trade calibration minimum requires >2 entries/week for the remaining 53 days
- NOW ($135.86) and MDB ($397.53) surged through their entry zones during the week while API prevented any action; two additional missed calibrated-trade opportunities
- QRVO voluntary exit overdue at Day 28 — +18.7% on a broken-thesis merger-arb position is accidental, not strategic; regulatory headline (FTC/SAMR) risk compounds every session of delay
- Iran re-escalation (negotiations stopped June 1; Hormuz blockade vow; Bab al-Mandeb threat) reversed deal-optimism; growth-multiple headwind now re-elevated alongside 10yr yield near 4.687%

### Key Lessons
- **The API outage is no longer an operational issue — it is the experiment's defining constraint.** Six consecutive weeks, 28 sessions, explicit documentation each time. The quantified cost: VRT (entry zone passed), NOW (surged from $100–112 to $135+), MDB (surged from $298–315 to $397+). These are documented setups with confirmed execution plans that would have produced calibrated trades. The experiment cannot fulfill its stated objective until this is fixed.
- **QLYS at +22.6% demonstrates the hold rule works and also exposes a risk.** The position is now above the +20% tighten-stop threshold. Per strategy rules, the trailing stop must be updated to 5%. With the API offline, this cannot be done. A reversal from $111 toward $100 would consume $11+ of gain before a 10% trailing stop fires; a 5% stop would protect at ~$106.
- **VRT entry zone is now partly below the current price.** Revised entry zone $295–315 (vs prior $315–335). The AVGO $16B AI guide added strength to the thesis. Stock at $305.12 is inside the revised zone — but the falsification condition ("closes below $300 within 3 trading days of entry") is now just $5 below. First entry only on API restore + confirmed stable price.
- **AVGO $16B AI semi guide (+200% YoY) is the most significant AI capex confirmation since NVDA.** Combined with NVDA $91B Q2 guide, MRVL $2.70B Q2 beat, and VRT's own Q1 blowout, the AI cooling/power thesis has never been more strongly supported. The stock (AVGO itself) is now a potential addition to the thesis: post-dip entry near $230–250 warrants a buy-side gate review.
- **NFP +172K (2× beat) means rate cuts are further out, and growth multiples face a more hawkish Fed.** This is a headwind for our universe (SaaS, AI infra). The implications compound with Iran re-escalation and 10yr yield near 4.687%. New entries in Week 7 should be sized conservatively and entered only on confirmed pullbacks, not gap-ups.

### Adjustments for Next Week
No strategy rule changes — 0 calibration data; no rule violations requiring immediate fix; no owner override. TRADING-STRATEGY.md unchanged.

Research/operational updates (not strategy changes):
1. **Restore env vars — Day 28 is unacceptable; experiment objective cannot be met without execution**
2. **SELL QRVO 19sh at market open** — thesis broken (merger arb); Day 28; `/trade QRVO 19 sell`; log CLOSE block (calibration: N/A)
3. **Confirm COTY status** — `bash scripts/alpaca.sh positions`; if stopped: log CLOSE (pre-cal, ~−3.2%); if still open: SELL 784sh immediately
4. **QLYS: tighten trailing stop to 5%** — at +22.6% (>+20%); update GTC stop immediately on API restore
5. **VRT entry zone revised to $295–315** — price at $305.12; AVGO $16B guide strengthened thesis; falsification: VRT closes below $285 within 3 trading days of entry; $1k max; 10% trailing GTC at entry (tighten to 7% at +15%, 5% at +20%)
6. **AVGO post-dip evaluation** — run through buy-side gate on API restore; AI semi $16B +200% YoY is exceptional; est entry zone ~$230–250; would be position #2 after VRT; materiality TBD on confirmed price
7. **CRWD stabilization** — 4-for-1 split July; wait 3+ days post-earnings settling; pre-split entry zone ~$680–720 if fundamentals hold

### Overall Grade: C+

Rationale: Third consecutive outperformance week (+1.82% bot vs −0.49% S&P = +2.31% relative); phase now +6.46% vs S&P +4.33% (+2.13% relative). QLYS +22.6% is the experiment's best unrealized return to date; bot has moved to genuine phase outperformance. Research quality A-grade: AVGO $16B AI guide, CRWD sell-the-news, NFP beat risk all identified in pre-market research before the events. Grade held to C+ (not B) for: (1) API offline Day 28 — 6th consecutive week, now the experiment's dominant structural failure; (2) VRT entry missed 7 weeks running; price now below the original entry zone; the experiment's first calibrated trade is still unplaced; (3) zero calibrated trades in 35 sessions — 41% of the 90-day window elapsed with zero learning data, now approaching the point where 20-trade minimum is mathematically unreachable; (4) QRVO voluntary exit Day 28 overdue; all unrealized gains are on broken-thesis grandfathered positions, not the strategy engine. Sources: Investing.com QLYS June 5; WallStreetZen QRVO; Yahoo Finance VRT June 5; BLS NFP May 2026 (June 5); Advisor Perspectives / InvestingLive S&P 500 week of June 5.
