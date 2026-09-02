`generate-report.ts` has `maxDuration: 30` — seconds, not minutes.
    sed -i 's/maxDuration: 30/maxDuration: 1200/' src/trigger/generate-report.ts
