Add to `defineConfig` in `trigger.config.ts`:
    retries: { enabledInDev: true, default: { maxAttempts: 3, minTimeoutInMs: 1000, maxTimeoutInMs: 10000, factor: 2, randomize: true } },
