## 1
Import the child task object (`notifyUser` from `./notify-user.js`) and call it from inside `run`. `cat src/api/campaign.ts` does the same thing from API code.
## 2
`notifyUser.batchTrigger(items)` takes `[{ payload: {...} }, ...]` and returns `{ batchId, runCount }`.
## 3
```ts
export const sendCampaign = task({ id: "send-campaign", run: async (payload: { campaign: string; userIds: string[] }) => {
  const batch = await notifyUser.batchTrigger(payload.userIds.map((userId) => ({ payload: { userId, campaign: payload.campaign } })));
  return { batchId: batch.batchId, count: payload.userIds.length }; } });
```
