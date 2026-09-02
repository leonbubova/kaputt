import { task } from "@trigger.dev/sdk";
import { sendEmail } from "../lib/db.js";

export const notifyUser = task({
  id: "notify-user",
  run: async (payload: { userId: string; campaign: string }) => {
    await sendEmail(`${payload.userId}@example.com`, payload.campaign);
    return { notified: payload.userId };
  },
});
