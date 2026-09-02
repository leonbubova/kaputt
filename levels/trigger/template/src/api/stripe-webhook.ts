import { idempotencyKeys } from "@trigger.dev/sdk";
import { chargeCard } from "../trigger/charge-card.js";
import { orders } from "../lib/db.js";

export type StripeEvent = { id: string; type: "payment_intent.succeeded"; orderId: string };

// Stripe retries webhooks; the same event may arrive several times
export async function handleStripeWebhook(event: StripeEvent) {
  const order = orders.get(event.orderId);
  if (!order) return { status: 404 };
  const handle = await chargeCard.trigger(
    { orderId: order.id, amountCents: order.totalCents },
    { idempotencyKey: await idempotencyKeys.create(event.id, { scope: "global" }) }
  );
  return { status: 200, runId: handle.id };
}
