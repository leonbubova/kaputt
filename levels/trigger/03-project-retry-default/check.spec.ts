import { it, expect } from "vitest";
import { indexProject, taskMeta } from "./harness.js";
it("project default retries: 3 attempts, 1s..10s; sync-crm keeps its own", async () => {
  const ix = await indexProject();
  const d = ix.config.retries?.default;
  expect(d, "no retries.default in trigger.config.ts").toBeTruthy();
  expect(d.maxAttempts).toBe(3);
  expect(d.minTimeoutInMs).toBe(1000);
  expect(d.maxTimeoutInMs).toBe(10000);
  expect(taskMeta("send-welcome-email").retry, "retry copied onto send-welcome-email instead of the project").toBeUndefined();
  expect(taskMeta("sync-crm").retry?.maxAttempts, "sync-crm's own policy changed").toBe(5);
});
