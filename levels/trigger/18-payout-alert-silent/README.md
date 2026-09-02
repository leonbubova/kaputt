# payout failures never reach on-call
"Since the v4 upgrade no `payout` failure produced a Slack alert. Run logs show `TypeError: Cannot destructure property 'ctx' of 'undefined'` coming from the failure hook, and `tsc` has been red in CI since the same PR (deploy still went through)." Goal: `tsc --noEmit` is clean and a failed payout alerts with the order id and the error message.
