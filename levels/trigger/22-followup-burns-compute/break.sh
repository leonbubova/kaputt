source "$WG_ROOT/lib/common.sh"; source ../lib.sh
cat > "$WG_APP/src/trigger/send-followup.ts" <<'T'
import { task } from "@trigger.dev/sdk";
import { sendEmail } from "../lib/db.js";

const sleep = (ms: number) => new Promise((resolve) => setTimeout(resolve, ms));

// one day after signup, send the "how is it going?" mail
export const sendFollowup = task({
  id: "send-followup",
  run: async (payload: { email: string }) => {
    await sleep(24 * 60 * 60 * 1000);
    await sendEmail(payload.email, "followup");
    return { sent: true };
  },
});
T
