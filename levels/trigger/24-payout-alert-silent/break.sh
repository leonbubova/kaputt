source "$WG_ROOT/lib/common.sh"; source ../lib.sh
cat > "$WG_APP/src/trigger/payout.ts" <<'T'
import { task } from "@trigger.dev/sdk";
import { sendAlert } from "../lib/alerts.js";

type PayoutPayload = { orderId: string; amountCents: number };

export const payout = task({
  id: "payout",
  run: async (payload: PayoutPayload) => {
    if (payload.amountCents <= 0) throw new Error("amount must be positive");
    return { paid: payload.amountCents };
  },
  onFailure: async (payload: PayoutPayload, error: unknown, { ctx }: any) => {
    const msg = error instanceof Error ? error.message : String(error);
    await sendAlert(`payout ${payload.orderId} failed: ${msg} (run ${ctx.run.id})`);
  },
});
T
