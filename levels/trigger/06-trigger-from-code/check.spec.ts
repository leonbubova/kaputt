import { it, expect, beforeAll, afterAll } from "vitest";
import { existsSync } from "node:fs";
import { indexProject, startFakeApi, APP, type FakeApi } from "./harness.js";
let api: FakeApi;
beforeAll(async () => { api = await startFakeApi(); await indexProject(); });
afterAll(() => api.close());
it("placeOrder() triggers one process-order run and returns its id", async () => {
  expect(existsSync(APP + "/src/api/orders.ts"), "file src/api/orders.ts missing").toBe(true);
  const { placeOrder } = await import(APP + "/src/api/orders.ts");
  expect(placeOrder, "export async function placeOrder missing").toBeTypeOf("function");
  const r = await placeOrder("ord_1002");
  expect(r?.runId, "runId returned").toMatch(/^run_/);
  expect(api.rec.triggers.length, "trigger() calls").toBe(1);
  expect(api.rec.triggers[0].taskId).toBe("process-order");
  expect(api.rec.triggers[0].payload).toEqual({ orderId: "ord_1002" });
  expect(api.rec.triggers[0].runId).toBe(r.runId);
});
