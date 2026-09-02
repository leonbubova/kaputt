import { queue } from "@trigger.dev/sdk";

// Shopify allows 2 concurrent API calls per store — every Shopify task must share this queue
export const shopifyQueue = queue({
  name: "shopify-api",
  concurrencyLimit: 2,
});
