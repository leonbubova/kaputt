import { it, expect } from "vitest";
import { indexProject, runTask, APP } from "./harness.js";
it("count-users returns the live size of the users map", async () => {
  const ix = await indexProject();
  expect(ix.importErrors, "task files fail to import").toEqual([]);
  expect(ix.taskIds, "task id count-users not registered").toContain("count-users");
  const { users } = await import(APP + "/src/lib/db.ts");
  expect(await runTask("count-users", {})).toEqual({ users: users.size });
  users.set("usr_9", { id: "usr_9", email: "z@example.com", name: "Zed" });
  expect(await runTask("count-users", {}), "number is typed out instead of read from the map").toEqual({ users: users.size });
});
