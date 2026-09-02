import { task } from "@trigger.dev/sdk";
import { sendAlert } from "../lib/alerts.js";

export const payout = task({
  id: "payout",
  run: async (payload: { orderId: string; amountCents: number }) => {
    if (payload.amountCents <= 0) throw new Error("amount must be positive");
    return { paid: payload.amountCents };
  },
  onFailure: async ({ payload, error }) => {
    const msg = error instanceof Error ? error.message : String(error);
    await sendAlert(`payout ${payload.orderId} failed: ${msg}`);
  },
});
