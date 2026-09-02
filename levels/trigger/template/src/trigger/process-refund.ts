import { task } from "@trigger.dev/sdk";
import { orders, refunds } from "../lib/db.js";

export const processRefund = task({
  id: "process-refund",
  run: async (payload: { orderId: string }) => {
    const order = orders.get(payload.orderId);
    if (!order) throw new Error(`order ${payload.orderId} not found`);
    refunds.push({ orderId: order.id, amountCents: order.totalCents });
    return { refunded: true, orderId: order.id };
  },
});
