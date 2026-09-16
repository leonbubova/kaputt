import { it, expect } from "vitest";
import { existsSync } from "node:fs";
import { indexProject, runTask, APP } from "./harness.js";
it("src/trigger/say-hi.ts defines task say-hi returning { hi: true }", async () => {
  expect(existsSync(APP + "/src/trigger/say-hi.ts"), "file src/trigger/say-hi.ts missing").toBe(true);
  const ix = await indexProject();
  expect(ix.importErrors, "task files fail to import").toEqual([]);
  expect(ix.taskIds, "task id say-hi not registered").toContain("say-hi");
  const mod = await import(APP + "/src/trigger/say-hi.ts");
  expect(mod.sayHi, "export const sayHi missing").toBeTruthy();
  const out = await runTask("say-hi", {});
  expect(out).toEqual({ hi: true });
});
