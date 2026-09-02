source "$WG_ROOT/lib/common.sh"; source ../lib.sh
cat > "$WG_APP/src/api/checkout.ts" <<'T'
import { chargeCard } from "../trigger/charge-card.js";

// POST /api/checkout — body comes straight from the storefront form
export function toChargePayload(body: any) {
  return { orderId: body.order_id, amountCents: body.amount_cents };
}

export async function checkout(body: any) {
  const handle = await chargeCard.trigger(toChargePayload(body));
  return { runId: handle.id };
}
T
