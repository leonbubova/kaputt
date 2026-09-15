Create `src/trigger/charge-card.ts` with `schemaTask({ id: "charge-card", schema: z.object({ orderId: z.string(), amountCents: z.number().int().positive() }), run })` — see hint 3.
