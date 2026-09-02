import { it, expect, beforeAll, afterAll } from "vitest";
import { indexProject, startFakeApi, APP, type FakeApi } from "./harness.js";
let api: FakeApi;
beforeAll(async () => { api = await startFakeApi(); await indexProject(); });
afterAll(() => api.close());
it("a redelivered Stripe event creates exactly one run", async () => {
  const { handleStripeWebhook } = await import(APP + "/src/api/stripe-webhook.ts");
  const ev = (id: string, orderId: string) => ({ id, type: "payment_intent.succeeded" as const, orderId });
  const a = await handleStripeWebhook(ev("evt_7", "ord_1001"));
  const b = await handleStripeWebhook(ev("evt_7", "ord_1001"));
  const c = await handleStripeWebhook(ev("evt_7", "ord_1001"));
  const d = await handleStripeWebhook(ev("evt_8", "ord_1002"));
  for (const r of [a, b, c, d]) expect(r.status).toBe(200);
  const runs = new Set(api.rec.triggers.filter((t) => t.taskId === "charge-card").map((t) => t.runId));
  expect(runs.size, "distinct charge-card runs for evt_7 (x3) + evt_8").toBe(2);
  expect(a.runId).toBe(b.runId); expect(b.runId).toBe(c.runId); expect(d.runId).not.toBe(a.runId);
  expect(api.rec.triggers[3].payload).toMatchObject({ orderId: "ord_1002", amountCents: 12000 });
});
