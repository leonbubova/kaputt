## 1
Each run executes on a machine preset. The default is `small-1x` (0.5 GB). A task picks a bigger one with the `machine` option next to its `id` — not in `trigger.config.ts`, which would move every task.
## 2
Presets and RAM: `micro` 0.25 GB, `small-1x` 0.5, `small-2x` 1, `medium-1x` 2, `medium-2x` 4, `large-1x` 8.
## 3
In `src/trigger/generate-report.ts` add `machine: "small-2x",` next to `id`.
