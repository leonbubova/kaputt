import { task } from "@trigger.dev/sdk";
import { orders } from "../lib/db.js";

export const processOrder = task({
  id: "process-order",
  run: async (payload: { orderId: string }) => {
    const order = orders.get(payload.orderId);
    if (!order) throw new Error(`order ${payload.orderId} not found`);
    return { processed: true, orderId: order.id };
  },
});
