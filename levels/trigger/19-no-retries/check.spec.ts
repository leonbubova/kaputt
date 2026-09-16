import { it, expect } from "vitest";
import { indexProject, effective, runTask } from "./harness.js";
it("sync-crm retries and eventually succeeds", async () => {
  const ix = await indexProject();
  const r = effective.retry("sync-crm", ix.config);
  expect(r.maxAttempts, "effective maxAttempts for sync-crm").toBeGreaterThanOrEqual(3);
  expect(ix.config.retries?.default?.maxAttempts, "project default changed").toBe(3);
  // simulate the attempts the platform would make
  let out: any, lastErr: any;
  for (let attempt = 1; attempt <= r.maxAttempts && !out; attempt++) {
    try { out = await runTask("sync-crm", { userId: "usr_1" }, { ctx: { attempt: { number: attempt } } }); }
    catch (e) { lastErr = e; }
  }
  expect(out, `never succeeded, last error: ${lastErr?.message}`).toMatchObject({ ok: true, id: "usr_1" });
});
