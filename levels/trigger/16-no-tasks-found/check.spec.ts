import { it, expect } from "vitest";
import { indexProject } from "./harness.js";
const ALL = ["send-welcome-email","process-order","process-refund","charge-card","sync-crm","generate-report","resize-images","sync-shopify","daily-digest","notify-user","send-followup","import-csv","payout","send-campaign"];
it("the CLI indexer finds every task", async () => {
  const ix = await indexProject();
  expect(ix.importErrors, "task files fail to import").toEqual([]);
  expect(ix.taskIds.sort(), `indexed from dirs ${ix.dirs.join(", ") || "(none)"}`).toEqual([...ALL].sort());
});
