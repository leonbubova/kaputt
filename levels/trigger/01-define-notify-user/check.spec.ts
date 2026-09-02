import { it, expect } from "vitest";
import { indexProject, runTask, APP } from "./harness.js";
it("notify-user exists, mails the user and returns { notified }", async () => {
  const ix = await indexProject();
  expect(ix.importErrors, "task files fail to import").toEqual([]);
  expect(ix.taskIds, "task id notify-user not registered").toContain("notify-user");
  const { sentEmails } = await import(APP + "/src/lib/db.ts");
  const out = await runTask("notify-user", { userId: "usr_9", campaign: "autumn" });
  expect(out).toMatchObject({ notified: "usr_9" });
  expect(sentEmails).toContainEqual({ to: "usr_9@example.com", template: "autumn" });
});
