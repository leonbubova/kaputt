import { chargeCard } from "../trigger/charge-card.js";

// POST /api/checkout — body comes straight from the storefront form (all values are strings)
export type CheckoutBody = { order_id: string; amount_cents: string };

export function toChargePayload(body: CheckoutBody) {
  return { orderId: body.order_id, amountCents: Number(body.amount_cents) };
}

export async function checkout(body: CheckoutBody) {
  const handle = await chargeCard.trigger(toChargePayload(body));
  return { runId: handle.id };
}
