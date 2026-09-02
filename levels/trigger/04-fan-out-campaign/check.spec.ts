import { it, expect, beforeAll, afterAll } from "vitest";
import { indexProject, runTask, startFakeApi, type FakeApi } from "./harness.js";
let api: FakeApi;
beforeAll(async () => { api = await startFakeApi(); await indexProject(); });
afterAll(() => api.close());
it("send-campaign fans out with one batch", async () => {
  const ids = Array.from({ length: 40 }, (_, i) => `usr_${i}`);
  const out = await runTask("send-campaign", { campaign: "autumn", userIds: ids });
  expect(out.count).toBe(40);
  expect(out.batchId, "batchId returned").toMatch(/^batch_/);
  expect(api.rec.triggers.length, "single trigger() calls").toBe(0);
  expect(api.rec.batches.length, "batches created").toBe(1);
  const items = api.rec.batches[0].items;
  expect(items.length).toBe(40);
  expect(items.every((i) => i.task === "notify-user" && i.payload.campaign === "autumn")).toBe(true);
  expect(new Set(items.map((i) => i.payload.userId)).size).toBe(40);
});
