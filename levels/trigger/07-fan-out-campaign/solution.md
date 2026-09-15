Create `src/trigger/send-campaign.ts`: a `task` whose `run` calls `notifyUser.batchTrigger(userIds.map(userId => ({ payload: { userId, campaign } })))` and returns `{ batchId, count }` — see hint 3.
