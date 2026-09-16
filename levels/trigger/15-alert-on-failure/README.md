# ticket: page on-call when a payout fails
"When a `payout` run fails for good, on-call must get an alert containing the **order id** and the **error message**. Use `sendAlert` from `src/lib/alerts.ts`." Goal: `payout` has a failure hook that does exactly that.
