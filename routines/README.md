# Cloud Routines

Five scheduled prompts that drive the bot. Each one is pasted verbatim
into the Claude Code cloud routine UI. Times are America/Chicago.

| File | Cron | When |
|------|------|------|
| pre-market.md | `0 6 * * 1-5` | 6:00 AM weekdays |
| market-open.md | `30 8 * * 1-5` | 8:30 AM weekdays (market open) |
| midday.md | `0 12 * * 1-5` | noon weekdays |
| daily-summary.md | `0 15 * * 1-5` | 3:00 PM weekdays (market close) |
| weekly-review.md | `0 16 * * 5` | 4:00 PM Fridays only |

Each prompt is structured the same way:

1. Persona and workflow line
2. Environment variable check (fail fast if a key is missing)
3. Paper-only guardrail (refuse to run if `ALPACA_ENDPOINT` is not paper)
4. Persistence warning
5. Numbered work steps
6. Slack notification (conditional per workflow — see Notification
   Philosophy in README.md)
7. `git commit && git push origin main`

If you change a prompt here, also re-paste it into the corresponding
cloud routine. The cloud routine uses the prompt stored in its UI, not
the file in the repo.
