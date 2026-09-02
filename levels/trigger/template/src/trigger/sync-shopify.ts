import { task } from "@trigger.dev/sdk";
import { shopifyQueue } from "./queues.js";

export const syncShopify = task({
  id: "sync-shopify",
  queue: shopifyQueue,
  run: async (payload: { productId: string }) => {
    return { synced: payload.productId };
  },
});
