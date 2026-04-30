# Trading Bot — Paper-Trading Edition

Autonomous swing-trading agent on top of Claude Code. Runs five
scheduled cloud routines per trading day, places paper orders on
Alpaca, journals to Git, and sends Slack notifications.

**Owner:** Quentin Rivera
**Capital:** $10,000 (paper)
**Window:** 90 days, ending 2026-07-29
**Status:** Pre-launch

---

## Architecture in one paragraph

Five cron jobs fire each weekday. Each one spins up a fresh Claude
Code cloud container, clones this repo, reads the markdown files in
`memory/`, calls the Alpaca paper API through `scripts/alpaca.sh`,
decides what to do, writes new memory, sends a Slack notification,
commits, and pushes back to `main`. There is no Python bot process —
Claude itself is the bot, and Git is the memory.

```
trading-bot/
├── CLAUDE.md            # Agent rulebook (auto-loaded every session)
├── README.md            # This file
├── env.template         # Template for local .env
├── .gitignore           # Excludes .env and DAILY-SUMMARY.md
├── .claude/commands/    # Local slash commands
├── routines/            # Cloud routine prompts (production)
├── scripts/             # API wrappers (alpaca.sh, slack.sh)
└── memory/              # Persistent state (committed to main)
    ├── TRADING-STRATEGY.md
    ├── TRADE-LOG.md
    ├── RESEARCH-LOG.md
    ├── WEEKLY-REVIEW.md
    └── PROJECT-CONTEXT.md
```

## Setup checklist

Do these in order. Each one is a real step you have to do.

### Accounts and credentials

- [ ] Create an Alpaca account at <https://alpaca.markets> → sign up,
      Trading API
- [ ] In the Alpaca paper-trading dashboard, scroll to **API Keys** →
      **Generate New Keys**. Copy the **Key ID** and **Secret Key**
      now — the secret only shows once
- [ ] Confirm the dashboard shows ~$100,000 in fake paper money. The
      bot's strategy is sized for $10k, so you will model that
      explicitly in the routine prompts (already done — see
      `memory/TRADING-STRATEGY.md`)
- [ ] In Slack, go to <https://api.slack.com/apps> → Create New App →
      From scratch
- [ ] Enable **Incoming Webhooks** for the app, add it to the channel
      you want notifications in (e.g., #trading-bot), copy the
      webhook URL

### Local repo bootstrap

- [ ] Create a private GitHub repo named `trading-bot`
- [ ] Copy this directory's contents into the repo, commit, push
- [ ] `cp env.template .env`
- [ ] Fill in `.env` with your real Alpaca paper key, secret, and
      Slack webhook URL. **Confirm `ALPACA_ENDPOINT` is the paper
      host** (`https://paper-api.alpaca.markets/v2`)
- [ ] `chmod +x scripts/*.sh`
- [ ] Smoke test: `bash scripts/alpaca.sh account` should print your
      account JSON. `bash scripts/slack.sh "hello from trading-bot"`
      should land in your Slack channel
- [ ] If either failed, fix before going further

### Cloud routine setup

Cloud routines run when your machine is off. They live in the Claude
Code cloud product, not in the repo. The repo just stores the
prompts you paste in.

- [ ] Install the **Claude GitHub App** on your `trading-bot` repo
      (least privilege; only this repo)
- [ ] In Claude Code → Routines → Environments, create a new
      environment called `trading`. Add these env vars:
      - `ALPACA_API_KEY`
      - `ALPACA_SECRET_KEY`
      - `ALPACA_ENDPOINT` (set to `https://paper-api.alpaca.markets/v2`)
      - `ALPACA_DATA_ENDPOINT` (set to `https://data.alpaca.markets/v2`)
      - `SLACK_WEBHOOK_URL`
- [ ] **Toggle on "Allow unrestricted branch pushes"** on this
      environment. Without this, `git push origin main` silently
      fails — this is the #1 reason first-time setups break
- [ ] Create five remote routines, one per file in `routines/`. For
      each one:
      - Repository: `trading-bot`, branch: `main`
      - Environment: `trading`
      - Cron: see the table below
      - Timezone: America/Chicago
      - Prompt: paste the file contents **verbatim** (everything
        below the `---` line)
- [ ] Click **Run now** on `pre-market` first. Watch the logs.
      Verify a `RESEARCH-LOG.md` commit appears in your repo
- [ ] If pre-market works, repeat **Run now** for the others one at a
      time. The market-open prompt will only place trades if today's
      research log says TRADE; otherwise it'll log "no plan, skipping"

### Cron table

| Routine | Cron (America/Chicago) | When |
|---------|-----------------------|------|
| pre-market | `0 6 * * 1-5` | 6:00 AM weekdays |
| market-open | `30 8 * * 1-5` | 8:30 AM weekdays |
| midday | `0 12 * * 1-5` | noon weekdays |
| daily-summary | `0 15 * * 1-5` | 3:00 PM weekdays |
| weekly-review | `0 16 * * 5` | 4:00 PM Fridays |

### Final pre-launch step

- [ ] Update `memory/TRADE-LOG.md`'s Day 0 snapshot date to your
      actual launch date if it's not 2026-04-30
- [ ] Read your first week of commits closely. Every commit. Trust
      grows from observation, not from setup

---

## Notification philosophy

| Routine | Sends a message? |
|---------|------------------|
| pre-market | Silent unless something is genuinely urgent |
| market-open | Only if a trade was placed |
| midday | Only if action was taken (sell, stop tightened, thesis exit) |
| daily-summary | Always (one message, ≤15 lines) |
| weekly-review | Always (one message, headline numbers + grade) |

Chatty bots get muted, then their important messages get missed. The
bot stays quiet on no-action days on purpose.

---

## Daily flow

```
6:00 AM  Pre-market: research, trade ideas, decision (TRADE/HOLD)
8:30 AM  Market-open: execute today's planned trades + 10% trailing stops
12:00 PM Midday: cut losers at -7%, tighten stops on winners
3:00 PM  Daily summary: EOD snapshot to TRADE-LOG, one Slack message
4:00 PM  (Fridays only) Weekly review: stats, lessons, grade
```

Between runs the container is destroyed. Memory only persists if it
made it to a `git push origin main`. Every routine prompt has a
mandatory commit-and-push step at the end.

---

## What to watch in the first week

- Did each routine commit a file? Check `git log --oneline` daily
- Did the bot place a trade? If yes, did it also place a trailing
  stop within 60 seconds? (Check Alpaca dashboard → Orders)
- Did Slack receive a daily summary every weekday? If not, debug the
  webhook URL
- Read the Friday weekly review carefully — the lessons section is
  where the bot will start adapting

---

## Killing the bot

If anything looks wrong: in Claude Code → Routines, **disable** all
five routines. The bot is now off. To resume, re-enable them.

To liquidate paper positions: `bash scripts/alpaca.sh close-all` and
`bash scripts/alpaca.sh cancel-all`.

---

## What this is not

- Not financial advice
- Not a recommended source of income
- Not a substitute for index funds (see Quentin's
  `Quentin_Investing_Foundation.md` — the satellite/active sleeve
  rules apply: cap at 10–20% of total invested assets, kill the
  experiment if underperforming the index after 24 months)
- Not connected to live money. The paper-only guardrail in every
  routine prompt refuses to trade against the live endpoint
