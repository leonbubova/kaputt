## 1
Each `trigger()` call is its own HTTP request to the platform, counted against the API rate limit, and a loop runs them one after another. A send that is slow *and* ends in 429 means one operation is being done as many calls. `cat src/api/campaign.ts` — how many API calls does one campaign make?
## 2
500 sequential `trigger()` calls = 500 round-trips and 500 rate-limit tokens. Trigger.dev has a bulk primitive for exactly this.
## 3
`await notifyUser.batchTrigger(userIds.map((userId) => ({ payload: { userId, campaign } })))` — one call, up to 500 items per batch.
