import { task } from "@trigger.dev/sdk";
import { notifyUser } from "./notify-user.js";

// fans a campaign out to all recipients — one notify-user run per user, in a single batch
export const sendCampaign = task({
  id: "send-campaign",
  run: async (payload: { campaign: string; userIds: string[] }) => {
    const batch = await notifyUser.batchTrigger(
      payload.userIds.map((userId) => ({ payload: { userId, campaign: payload.campaign } }))
    );
    return { batchId: batch.batchId, count: payload.userIds.length };
  },
});
