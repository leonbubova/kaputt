import { task } from "@trigger.dev/sdk";
import { sendEmail, users } from "../lib/db.js";

export const sendWelcomeEmail = task({
  id: "send-welcome-email",
  run: async (payload: { userId: string }) => {
    const user = users.get(payload.userId);
    if (!user) throw new Error(`user ${payload.userId} not found`);
    await sendEmail(user.email, "welcome");
    return { sent: true, to: user.email };
  },
});
