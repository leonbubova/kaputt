import { it, expect } from "vitest";
import { indexProject, taskMeta, runTask } from "./harness.js";
it("ping-crm declares retry.maxAttempts = 4 and succeeds within those attempts", async () => {
  const ix = await indexProject();
  expect(ix.importErrors, "task files fail to import").toEqual([]);
  expect(ix.taskIds, "task id ping-crm missing — keep id: \"ping-crm\"").toContain("ping-crm");
  const r = taskMeta("ping-crm").retry;
  expect(r, "retry option missing on the task").toBeTruthy();
  expect(r.maxAttempts).toBe(4);
  let out: any; let attempts = 0;
  for (let attempt = 1; attempt <= r.maxAttempts && !out; attempt++) {
    attempts++;
    try { out = await runTask("ping-crm", {}, { ctx: { attempt: { number: attempt } } }); } catch {}
  }
  expect(out, "run never succeeded — did you change run()?").toMatchObject({ ok: true });
  expect(attempts, "crm.ts must stay as it is: it fails the first two calls").toBe(3);
});
