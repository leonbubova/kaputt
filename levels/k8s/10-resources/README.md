# give web a resource budget
Ticket: "Ops wants every workload in `wg` to say what it needs. Put resource requests of `100m` CPU / `64Mi` memory and limits of `200m` CPU / `128Mi` memory on the container of the `web` deployment."
Goal: `web` is still 2/2 available and its pod template carries exactly those requests and limits.
