import { it, expect } from "vitest";
import { indexProject, taskMeta, runTask, APP } from "./harness.js";
it("charge-card exists, validates its payload and charges", async () => {
  const ix = await indexProject();
  expect(ix.taskIds, "task id charge-card not registered").toContain("charge-card");
  const t = taskMeta("charge-card");
  expect(t.fns.parsePayload, "no payload schema (use schemaTask)").toBeTypeOf("function");
  await expect(runTask("charge-card", { orderId: "ord_1001", amountCents: "4999" }), "string amount accepted").rejects.toThrow();
  await expect(runTask("charge-card", { orderId: "ord_1001", amountCents: -5 }), "negative amount accepted").rejects.toThrow();
  await expect(runTask("charge-card", { orderId: "ord_1001" }), "missing amount accepted").rejects.toThrow();
  const { charges } = await import(APP + "/src/lib/db.ts");
  const out = await runTask("charge-card", { orderId: "ord_1001", amountCents: 4999 });
  expect(out).toMatchObject({ charged: 4999, orderId: "ord_1001" });
  expect(charges).toContainEqual({ orderId: "ord_1001", amountCents: 4999 });
});
