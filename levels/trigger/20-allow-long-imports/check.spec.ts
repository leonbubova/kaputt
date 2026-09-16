import { it, expect } from "vitest";
import { indexProject, effective } from "./harness.js";
it("import-csv may run 10 minutes, the project cap stays 5", async () => {
  const ix = await indexProject();
  expect(effective.maxDuration("import-csv", ix.config), "effective maxDuration of import-csv (s)").toBeGreaterThanOrEqual(600);
  expect(ix.config.maxDuration, "project-wide cap changed").toBe(300);
  expect(effective.maxDuration("send-welcome-email", ix.config), "other tasks").toBe(300);
});
