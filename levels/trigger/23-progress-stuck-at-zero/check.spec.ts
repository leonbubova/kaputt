import { it, expect } from "vitest";
import { indexProject, runTaskWithMetadata } from "./harness.js";
it("import-csv reports progress through run metadata", async () => {
  await indexProject();
  const { result, metadata } = await runTaskWithMetadata("import-csv", { rows: 1000 });
  expect(result).toMatchObject({ imported: 1000 });
  expect(metadata, "run metadata after completion").toMatchObject({ progress: 100, rows: 1000 });
});
