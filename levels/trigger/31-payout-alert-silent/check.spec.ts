import { it, expect } from "vitest";
import { indexProject, failureHook, runTask, APP } from "./harness.js";
it("a failing payout alerts on-call with order id and error", async () => {
  await indexProject();
  const { alerts } = await import(APP + "/src/lib/alerts.ts");
  const payload = { orderId: "ord_1002", amountCents: 0 };
  let error: unknown;
  try { await runTask("payout", payload); } catch (e) { error = e; }
  expect(error, "payout with amount 0 should fail").toBeInstanceOf(Error);
  const hook = failureHook("payout");
  expect(hook, "payout has no onFailure hook").toBeTypeOf("function");
  const ctx = { run: { id: "run_wg_fail1", tags: [], isTest: false, isReplay: false, createdAt: new Date(), startedAt: new Date() }, task: { id: "payout", filePath: "x.ts" }, attempt: { number: 3, startedAt: new Date() } } as any;
  await hook({ payload, error, ctx, task: "payout", signal: new AbortController().signal });
  expect(alerts.length, "alerts sent").toBeGreaterThan(0);
  expect(alerts.at(-1)).toContain("ord_1002");
  expect(alerts.at(-1)).toContain("amount must be positive");
});
