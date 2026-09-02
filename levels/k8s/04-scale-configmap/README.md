# scale up and write it down
Ticket: "Traffic doubled. Scale `web` in `wg` to 4 replicas. Then record the new count for the ops wiki: create a ConfigMap `notes` with the key `podcount` set to `4`."
Goal: `web` has 4 available replicas, ConfigMap `notes` has `podcount=4`.
