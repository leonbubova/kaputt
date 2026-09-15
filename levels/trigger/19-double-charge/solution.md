`handleStripeWebhook` triggers without an idempotency key.
    # chargeCard.trigger(payload, { idempotencyKey: await idempotencyKeys.create(event.id, { scope: "global" }) })
