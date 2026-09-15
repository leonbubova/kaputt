# let the reporter list pods
Ticket: "A new `reporter` job will run under its own identity and only needs to read pods in `wg`. Create ServiceAccount `reporter`, a Role `pod-reader` allowing `get` and `list` on pods, and tie them together with RoleBinding `reporter-reads-pods`."
Goal: `reporter` can list pods in `wg` — and nothing else: no other verbs, no other resources, no other namespaces.
