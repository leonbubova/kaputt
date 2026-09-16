import { it, expect } from "vitest";
import { indexProject, runTask } from "./harness.js";
it("hello returns { message: 'hello, trigger' }", async () => {
  const ix = await indexProject();
  expect(ix.importErrors, "task files fail to import").toEqual([]);
  expect(ix.taskIds, "task id hello missing — keep id: \"hello\"").toContain("hello");
  const out = await runTask("hello", {});
  expect(out).toEqual({ message: "hello, trigger" });
});
