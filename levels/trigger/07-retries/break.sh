source "$WG_ROOT/lib/common.sh"; source ../lib.sh
cat > "$WG_APP/src/trigger/ping-crm.ts" <<'T'
import { task } from "@trigger.dev/sdk";
import { crmUpsert } from "../lib/crm.js";

export const pingCrm = task({
  id: "ping-crm",
  run: async () => {
    return await crmUpsert({ id: "usr_1", email: "ana@example.com" });
  },
});
T
