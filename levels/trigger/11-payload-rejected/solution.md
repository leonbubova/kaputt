`toChargePayload` passes the storefront's string `amount_cents` through; the zod schema wants a number.
    # src/api/checkout.ts:  amountCents: Number(body.amount_cents)
