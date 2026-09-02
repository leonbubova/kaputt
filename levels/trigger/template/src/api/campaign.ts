import { notifyUser } from "../trigger/notify-user.js";

// marketing sends a campaign to all users at once (thousands)
export async function notifyAll(userIds: string[], campaign: string) {
  const handle = await notifyUser.batchTrigger(
    userIds.map((userId) => ({ payload: { userId, campaign } }))
  );
  return { batchId: handle.batchId, count: userIds.length };
}
