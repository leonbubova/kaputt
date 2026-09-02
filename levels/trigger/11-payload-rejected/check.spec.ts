import { it, expect, beforeAll, afterAll } from "vitest";
import { indexProject, runTask, startFakeApi, APP, type FakeApi } from "./harness.js";
let api: FakeApi;
beforeAll(async () => { api = await startFakeApi(); await indexProject(); });
afterAll(() => api.close());
it("a storefront checkout creates a charge-card run that charges 4999 cents", async () => {
  const { checkout } = await import(APP + "/src/api/checkout.ts");
  const res = await checkout({ order_id: "ord_1001", amount_cents: "4999" });
  expect(res.runId).toMatch(/^run_/);
  const t = api.rec.triggers.find((x) => x.taskId === "charge-card");
  expect(t, "no charge-card run was triggered").toBeTruthy();
  const out = await runTask("charge-card", t!.payload);
  expect(out).toMatchObject({ orderId: "ord_1001", charged: 4999 });
  expect(typeof out.charged).toBe("number");
});
