import { it, expect } from "vitest";
import { indexProject, manifest, runTask } from "./harness.js";
it("daily-digest is scheduled 09:00 Europe/Berlin", async () => {
  const ix = await indexProject();
  expect(ix.taskIds, "task daily-digest not registered").toContain("daily-digest");
  const m = manifest("daily-digest");
  expect(m.triggerSource, "not a schedules.task").toBe("schedule");
  expect(m.schedule, "no declarative cron on the task").toBeTruthy();
  expect(m.schedule.cron.trim().split(/\s+/).slice(0, 2), "cron minute/hour").toEqual(["0", "9"]);
  expect(m.schedule.timezone, "timezone").toBe("Europe/Berlin");
  const ts = new Date("2026-09-03T07:00:00Z");
  const out = await runTask("daily-digest", { timestamp: ts, lastTimestamp: undefined, timezone: "Europe/Berlin", scheduleId: "sched_x", upcoming: [] });
  expect(out).toMatchObject({ timezone: "Europe/Berlin" });
});
