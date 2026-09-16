import { it, expect } from "vitest";
import { indexProject, effective, MACHINE_GB } from "./harness.js";
it("generate-report runs on >= 1 GB, cheap tasks stay small", async () => {
  const ix = await indexProject();
  expect(ix.config.machine, "machine set project-wide instead of on the task").toBeUndefined();
  const m = effective.machine("generate-report", ix.config) ?? "small-1x";
  expect(MACHINE_GB[m], `unknown machine preset "${m}"`).toBeDefined();
  expect(MACHINE_GB[m], `generate-report runs on ${m}`).toBeGreaterThanOrEqual(1);
  const cheap = effective.machine("send-welcome-email", ix.config) ?? "small-1x";
  expect(MACHINE_GB[cheap], `send-welcome-email now runs on ${cheap}`).toBeLessThanOrEqual(0.5);
});
