One `trigger()` per user in a loop.
    # src/api/campaign.ts: notifyUser.batchTrigger(userIds.map((userId) => ({ payload: { userId, campaign } })))
