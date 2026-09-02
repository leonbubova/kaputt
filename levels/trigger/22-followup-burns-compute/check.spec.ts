import { it, expect, beforeAll, afterAll } from "vitest";
import { indexProject, runTask, startFakeApi, APP, type FakeApi } from "./harness.js";
let api: FakeApi;
beforeAll(async () => { api = await startFakeApi(); await indexProject(); });
afterAll(() => api.close());
it("send-followup hands the 24h wait to the platform", async () => {
  const { sentEmails } = await import(APP + "/src/lib/db.ts");
  const t0 = Date.now();
  const r = await runTask("send-followup", { email: "ana@example.com" });
  expect(Date.now() - t0, "run() wall time (ms)").toBeLessThan(3000);
  expect(r).toMatchObject({ sent: true });
  const w = api.rec.waits[0];
  expect(w, "no wait registered with the platform").toBeTruthy();
  const hours = (w.date.getTime() - t0) / 3.6e6;
  expect(hours, "wait length in hours").toBeGreaterThan(23.9);
  expect(hours).toBeLessThan(24.1);
  expect(sentEmails.some((e) => e.to === "ana@example.com" && e.template === "followup")).toBe(true);
}, 8000);
