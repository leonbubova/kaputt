import { sendWelcomeEmail } from "../trigger/send-welcome-email.js";

// POST /api/signup — the account is created, the welcome mail goes out in the background
export async function signup(userId: string) {
  const handle = await sendWelcomeEmail.trigger({ userId });
  return { runId: handle.id };
}
