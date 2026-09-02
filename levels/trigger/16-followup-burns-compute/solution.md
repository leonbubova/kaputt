Sleeping with `setTimeout` inside `run()` keeps the machine busy (and hits `maxDuration`).
    # src/trigger/send-followup.ts:  await wait.for({ days: 1 });
