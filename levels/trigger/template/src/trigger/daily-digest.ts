import { schedules } from "@trigger.dev/sdk";

// every morning at 09:00 Berlin time, before the team standup
export const dailyDigest = schedules.task({
  id: "daily-digest",
  cron: { pattern: "0 9 * * *", timezone: "Europe/Berlin" },
  run: async (payload) => {
    return { ranAt: payload.timestamp.toISOString(), timezone: payload.timezone };
  },
});
