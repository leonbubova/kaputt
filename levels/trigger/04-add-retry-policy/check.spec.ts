import { it, expect } from "vitest";
import { indexProject, taskMeta, runTask } from "./harness.js";
it("sync-crm has its own retry policy: 5 attempts, 2s..30s", async () => {
  const ix = await indexProject();
  const r = taskMeta("sync-crm").retry;
  expect(r, "task-level retry missing").toBeTruthy();
  expect(r.maxAttempts).toBe(5);
  expect(r.minTimeoutInMs).toBe(2000);
  expect(r.maxTimeoutInMs).toBe(30000);
  expect(ix.config.retries?.default, "project default changed").toMatchObject({ maxAttempts: 3, minTimeoutInMs: 1000 });
  let out: any;
  for (let attempt = 1; attempt <= r.maxAttempts && !out; attempt++) {
    try { out = await runTask("sync-crm", { userId: "usr_1" }, { ctx: { attempt: { number: attempt } } }); } catch {}
  }
  expect(out).toMatchObject({ ok: true });
});
