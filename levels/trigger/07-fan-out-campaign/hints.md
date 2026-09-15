## 1
Tasks trigger other tasks the same way API code does: import the child task object and call a method on it from inside `run`. A batch is one API call that creates many runs — that's what separates it from looping over `trigger()`. Import `notifyUser` from `./notify-user.js`; `cat src/api/campaign.ts` does the same thing from API code.
## 2
`notifyUser.batchTrigger(items)` takes `[{ payload: {...} }, ...]` and returns `{ batchId, runCount }`.
## 3
```ts
export const sendCampaign = task({ id: "send-campaign", run: async (payload: { campaign: string; userIds: string[] }) => {
  const batch = await notifyUser.batchTrigger(payload.userIds.map((userId) => ({ payload: { userId, campaign: payload.campaign } })));
  return { batchId: batch.batchId, count: payload.userIds.length }; } });
```
