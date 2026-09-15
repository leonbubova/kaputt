import { it, expect } from "vitest";
import { indexProject, runTask } from "./harness.js";
it("both tasks exist with distinct ids and do their own job", async () => {
  const ix = await indexProject();
  expect(ix.collisions, "duplicate task ids").toEqual([]);
  expect(ix.taskIds).toContain("process-refund");
  expect(ix.taskIds).toContain("process-order");
  const r = await runTask("process-refund", { orderId: "ord_1002" });
  expect(r).toMatchObject({ refunded: true, orderId: "ord_1002" });
  const o = await runTask("process-order", { orderId: "ord_1001" });
  expect(o).toMatchObject({ processed: true });
});
