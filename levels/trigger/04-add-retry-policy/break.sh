source "$WG_ROOT/lib/common.sh"; source ../lib.sh
cat > "$WG_APP/src/trigger/sync-crm.ts" <<'T'
import { task } from "@trigger.dev/sdk";
import { crmUpsert } from "../lib/crm.js";
import { users } from "../lib/db.js";

export const syncCrm = task({
  id: "sync-crm",
  run: async (payload: { userId: string }) => {
    const user = users.get(payload.userId);
    if (!user) throw new Error(`user ${payload.userId} not found`);
    return await crmUpsert({ id: user.id, email: user.email });
  },
});
T
