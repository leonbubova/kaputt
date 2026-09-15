source "$WG_ROOT/lib/common.sh"; source ../lib.sh
cat > "$WG_APP/src/trigger/sync-shopify.ts" <<'T'
import { task } from "@trigger.dev/sdk";

export const syncShopify = task({
  id: "sync-shopify",
  queue: { name: "shopify" },
  run: async (payload: { productId: string }) => {
    return { synced: payload.productId };
  },
});
T
