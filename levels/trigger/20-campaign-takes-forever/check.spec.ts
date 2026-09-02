import { it, expect, beforeAll, afterAll } from "vitest";
import { indexProject, startFakeApi, APP, type FakeApi } from "./harness.js";
let api: FakeApi;
beforeAll(async () => { api = await startFakeApi(15); await indexProject(); });   // 15 ms per API round-trip
afterAll(() => api.close());
it("notifyAll(500) batches", async () => {
  const { notifyAll } = await import(APP + "/src/api/campaign.ts");
  const ids = Array.from({ length: 500 }, (_, i) => `usr_${i}`);
  const t0 = Date.now();
  const r = await notifyAll(ids, "summer-sale");
  expect(Date.now() - t0, "ms taken").toBeLessThan(5000);
  expect(r.count).toBe(500);
  expect(api.rec.triggers.length, "single-run trigger calls").toBe(0);
  const items = api.rec.batches.flatMap((b) => b.items);
  expect(items.length).toBe(500);
  expect(new Set(items.map((i) => i.payload.userId)).size).toBe(500);
  expect(items.every((i) => i.task === "notify-user" && i.payload.campaign === "summer-sale")).toBe(true);
}, 15000);
