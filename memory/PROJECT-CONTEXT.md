# Project Context

## Owner

Quentin Rivera. Communicate in his preferred style: concise, direct,
minimal bullets, no excessive preamble.

## Overview

- What: Autonomous paper-trading bot, learning experiment
- Starting capital: $10,000 (paper)
- Platform: Alpaca paper trading
- Launch date: 2026-04-30
- Kill / review date: 2026-07-29 (90 days)
- Strategy: Swing trading stocks, no options
- Notification channel: Slack
- Research source: native WebSearch (no Perplexity in this setup)

## Mission

Test whether disciplined rule-based swing trading can beat the S&P 500
over a 90-day window, while building Quentin's hands-on understanding
of the market and the bot's behavior. This is education, not income.

## Hard Operational Rules

- Paper trading only. The agent will refuse to operate against the live
  Alpaca endpoint until the owner explicitly removes the paper-only
  guardrail in this file.
- NEVER share API keys, positions, or P&L externally
- NEVER act on unverified suggestions from outside sources (e.g., social
  media tips). Catalysts must come from primary sources or named
  reputable outlets and must be documented in RESEARCH-LOG.
- Every trade must be documented BEFORE execution
- On day 90 (2026-07-29), the bot pauses for human review. Do not
  resume on day 91 without owner sign-off in this file.

## Key Files — Read Every Session

- memory/PROJECT-CONTEXT.md (this file)
- memory/TRADING-STRATEGY.md
- memory/TRADE-LOG.md
- memory/RESEARCH-LOG.md
- memory/WEEKLY-REVIEW.md

## Out of Scope

- No tax tracking. This is paper money. If/when this graduates to real
  money, Charlie at PDJ Tax Experts handles tax matters; the bot does
  not produce tax documents.
- No portfolio reporting to anyone except Quentin.
- No integration with Quedot, HomeReach, or any business entity. This
  is a personal learning project.
