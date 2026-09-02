## 1
Exit code 137 = the container hit its memory limit. The default machine `small-1x` has 0.5 GB.
## 2
Machine presets: micro 0.25 GB, small-1x 0.5, small-2x 1, medium-1x 2, medium-2x 4, large-1x 8. Set it per task, not project-wide.
## 3
In `src/trigger/resize-images.ts` add `machine: "medium-1x"` next to `id`.
