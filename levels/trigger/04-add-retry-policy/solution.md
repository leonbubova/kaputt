Add to the task options in `src/trigger/sync-crm.ts`:
    retry: { maxAttempts: 5, minTimeoutInMs: 2000, maxTimeoutInMs: 30000, factor: 2, randomize: true },
