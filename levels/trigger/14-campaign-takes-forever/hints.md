## 1
`cat src/api/campaign.ts` — how many API calls does one campaign make?
## 2
500 sequential `trigger()` calls = 500 round-trips and 500 rate-limit tokens. Trigger.dev has a bulk primitive for exactly this.
## 3
`await notifyUser.batchTrigger(userIds.map((userId) => ({ payload: { userId, campaign } })))` — one call, up to 500 items per batch.
