import { task } from "@trigger.dev/sdk";
import { crmUpsert } from "../lib/crm.js";
import { users } from "../lib/db.js";

// the CRM API is flaky after cold starts: retry up to 5 times, 2 s → 30 s exponential backoff
export const syncCrm = task({
  id: "sync-crm",
  retry: {
    maxAttempts: 5,
    minTimeoutInMs: 2000,
    maxTimeoutInMs: 30000,
    factor: 2,
    randomize: true,
  },
  run: async (payload: { userId: string }) => {
    const user = users.get(payload.userId);
    if (!user) throw new Error(`user ${payload.userId} not found`);
    return await crmUpsert({ id: user.id, email: user.email });
  },
});
