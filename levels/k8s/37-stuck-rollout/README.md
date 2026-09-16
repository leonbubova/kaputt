# deploy stuck at 2/3
"Someone shipped `web` v2 an hour ago. `rollout status` hangs, one pod is broken, two old ones serve traffic." Goal: 3/3 available on a working image, no broken pods left. Bonus: figure out what v2 was before you roll back.
