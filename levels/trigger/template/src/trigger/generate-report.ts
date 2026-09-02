import { task } from "@trigger.dev/sdk";

// monthly finance report: walks every order of the month, ~10-15 minutes in prod
export const generateReport = task({
  id: "generate-report",
  maxDuration: 1200,
  machine: "small-2x",
  run: async (payload: { month: string }) => {
    return { month: payload.month, url: `s3://reports/${payload.month}.pdf` };
  },
});
