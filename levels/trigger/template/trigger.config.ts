import { defineConfig } from "@trigger.dev/sdk";

export default defineConfig({
  project: "proj_wgshop00000000000000",
  runtime: "node",
  logLevel: "log",
  // every task may run at most 5 minutes unless it says otherwise
  maxDuration: 300,
  retries: {
    enabledInDev: true,
    default: {
      maxAttempts: 3,
      minTimeoutInMs: 1000,
      maxTimeoutInMs: 10000,
      factor: 2,
      randomize: true,
    },
  },
  dirs: ["./src/trigger"],
});
