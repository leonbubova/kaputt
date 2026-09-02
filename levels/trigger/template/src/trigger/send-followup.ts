import { task, wait } from "@trigger.dev/sdk";
import { sendEmail } from "../lib/db.js";

// one day after signup, send the "how is it going?" mail
export const sendFollowup = task({
  id: "send-followup",
  run: async (payload: { email: string }) => {
    await wait.for({ days: 1 });
    await sendEmail(payload.email, "followup");
    return { sent: true };
  },
});
