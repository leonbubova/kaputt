import { it, expect } from "vitest";
import { indexProject, taskMeta, queues } from "./harness.js";
it("sync-shopify sits in a queue limited to 2 concurrent runs", async () => {
  await indexProject();
  const q = taskMeta("sync-shopify").queue;
  expect(q?.name, "task has no queue").toBeTruthy();
  const def = queues().find((x) => x.name === q.name);
  expect(def, `queue "${q.name}" is not defined anywhere`).toBeTruthy();
  const limit = def!.concurrencyLimit ?? q.concurrencyLimit;
  expect(limit, `queue "${q.name}" has no concurrency limit`).toBeDefined();
  expect(limit).toBeGreaterThanOrEqual(1);
  expect(limit).toBeLessThanOrEqual(2);
});
