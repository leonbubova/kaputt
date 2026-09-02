## 1
Look at a sibling for the shape: `cat src/trigger/process-order.ts`. A task = `task({ id, run })` exported from a file under `src/trigger`.
## 2
For a validated payload use `schemaTask` from `@trigger.dev/sdk` with `schema: z.object({...})` — the payload type of `run` is then inferred, and `trigger()` rejects bad payloads before a run exists.
## 3
```ts
import { schemaTask } from "@trigger.dev/sdk"; import { z } from "zod"; import { charges } from "../lib/db.js";
export const chargeCard = schemaTask({ id: "charge-card",
  schema: z.object({ orderId: z.string(), amountCents: z.number().int().positive() }),
  run: async (payload) => { charges.push({ orderId: payload.orderId, amountCents: payload.amountCents }); return { charged: payload.amountCents, orderId: payload.orderId }; } });
```
