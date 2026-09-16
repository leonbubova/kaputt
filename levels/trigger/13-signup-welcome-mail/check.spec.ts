import { it, expect, beforeAll, afterAll } from "vitest";
import { indexProject, startFakeApi, APP, type FakeApi } from "./harness.js";
let api: FakeApi;
beforeAll(async () => { api = await startFakeApi(); await indexProject(); });
afterAll(() => api.close());
it("signup() triggers one send-welcome-email run and returns its id", async () => {
  const { signup } = await import(APP + "/src/api/signup.ts");
  const r = await signup("usr_1");
  expect(r.runId, "runId returned").toMatch(/^run_/);
  expect(api.rec.triggers.length, "trigger() calls").toBe(1);
  expect(api.rec.triggers[0].taskId).toBe("send-welcome-email");
  expect(api.rec.triggers[0].payload).toEqual({ userId: "usr_1" });
  expect(api.rec.triggers[0].runId).toBe(r.runId);
});
