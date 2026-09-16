import { it, expect } from "vitest";
import { logger } from "@trigger.dev/core/v3";
import { indexProject, runTask } from "./harness.js";
// the SDK's logger is a no-op outside a real run — plug in one that records
const lines: { level: string; message: string }[] = [];
const rec = (level: string) => (message: string) => { lines.push({ level, message }); };
logger.setGlobalTaskLogger({
  debug: rec("debug"), log: rec("log"), info: rec("info"), warn: rec("warn"), error: rec("error"),
  trace: (_name: string, fn: any) => fn({}), startSpan: () => ({}),
} as any);
it("greet logs 'greeting NAME' at level info", async () => {
  const ix = await indexProject();
  expect(ix.importErrors, "task files fail to import").toEqual([]);
  expect(await runTask("greet", { name: "Ada" })).toEqual({ greeting: "hello, Ada" });
  expect(lines, "no info line 'greeting Ada' logged").toContainEqual({ level: "info", message: "greeting Ada" });
  lines.length = 0;
  await runTask("greet", { name: "Bo" });
  expect(lines).toContainEqual({ level: "info", message: "greeting Bo" });
});
