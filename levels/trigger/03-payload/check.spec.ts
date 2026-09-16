import { it, expect } from "vitest";
import { indexProject, runTask } from "./harness.js";
it("greet uses payload.name", async () => {
  const ix = await indexProject();
  expect(ix.importErrors, "task files fail to import").toEqual([]);
  expect(ix.taskIds, "task id greet missing — keep id: \"greet\"").toContain("greet");
  expect(await runTask("greet", { name: "Ada" })).toEqual({ greeting: "hello, Ada" });
  expect(await runTask("greet", { name: "Bo" })).toEqual({ greeting: "hello, Bo" });
});
