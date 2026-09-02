import { it, expect } from "vitest";
import { indexProject, effective } from "./harness.js";
it("generate-report may run 10+ minutes, others keep the 5-minute cap", async () => {
  const ix = await indexProject();
  expect(effective.maxDuration("generate-report", ix.config), "effective maxDuration of generate-report (s)").toBeGreaterThanOrEqual(600);
  expect(effective.maxDuration("send-welcome-email", ix.config), "project-wide cap changed").toBe(300);
});
