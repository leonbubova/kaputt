source "$WG_ROOT/lib/common.sh"; source ../lib.sh
cat > "$WG_APP/src/api/campaign.ts" <<'T'
import { notifyUser } from "../trigger/notify-user.js";

// marketing sends a campaign to all users at once (thousands)
export async function notifyAll(userIds: string[], campaign: string) {
  const runIds: string[] = [];
  for (const userId of userIds) {
    const handle = await notifyUser.trigger({ userId, campaign });
    runIds.push(handle.id);
  }
  return { runIds, count: runIds.length };
}
T
