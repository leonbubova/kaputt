# ticket: campaign fan-out task
"Add task `send-campaign` with payload `{ campaign: string, userIds: string[] }`. It must create one `notify-user` run per user (payload `{ userId, campaign }`) in a **single batch** — not one trigger call per user — and return `{ batchId, count }`." Goal: exactly that.
