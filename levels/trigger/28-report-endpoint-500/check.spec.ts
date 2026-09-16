import { it, expect, beforeAll, afterAll } from "vitest";
import { indexProject, startFakeApi, APP, type FakeApi } from "./harness.js";
let api: FakeApi;
beforeAll(async () => { api = await startFakeApi(); await indexProject(); });
afterAll(() => api.close());
it("requestReport triggers a run from plain backend code", async () => {
  const { requestReport } = await import(APP + "/src/api/reports.ts");
  const r = await requestReport("2026-08");
  expect(r.runId).toMatch(/^run_/);
  const t = api.rec.triggers.find((x) => x.runId === r.runId);
  expect(t, "returned runId does not belong to a triggered run").toBeTruthy();
  expect(t!.taskId).toBe("generate-report");
  expect(t!.payload).toEqual({ month: "2026-08" });
});
