import { it, expect } from "vitest";
import { indexProject, effective, MACHINE_GB } from "./harness.js";
it("resize-images gets a machine with >= 2 GB, cheap tasks stay small", async () => {
  const ix = await indexProject();
  const m = effective.machine("resize-images", ix.config) ?? "small-1x";
  expect(MACHINE_GB[m], `unknown machine preset "${m}"`).toBeDefined();
  expect(MACHINE_GB[m], `resize-images runs on ${m}`).toBeGreaterThanOrEqual(2);
  const cheap = effective.machine("send-welcome-email", ix.config) ?? "small-1x";
  expect(MACHINE_GB[cheap], `send-welcome-email now runs on ${cheap}`).toBeLessThanOrEqual(0.5);
});
