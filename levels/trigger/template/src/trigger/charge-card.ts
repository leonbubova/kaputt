import { schemaTask } from "@trigger.dev/sdk";
import { z } from "zod";
import { charges } from "../lib/db.js";

export const chargeCard = schemaTask({
  id: "charge-card",
  schema: z.object({
    orderId: z.string(),
    amountCents: z.number().int().positive(),
  }),
  run: async (payload) => {
    charges.push({ orderId: payload.orderId, amountCents: payload.amountCents });
    return { charged: payload.amountCents, orderId: payload.orderId };
  },
});
