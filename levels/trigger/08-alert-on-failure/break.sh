source "$WG_ROOT/lib/common.sh"; source ../lib.sh
cat > "$WG_APP/src/trigger/payout.ts" <<'T'
import { task } from "@trigger.dev/sdk";

export const payout = task({
  id: "payout",
  run: async (payload: { orderId: string; amountCents: number }) => {
    if (payload.amountCents <= 0) throw new Error("amount must be positive");
    return { paid: payload.amountCents };
  },
});
T
