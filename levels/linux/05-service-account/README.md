# service account for the runner
Ticket: "Create a group `svc` and a user `runner` whose primary group is `svc`, with a home directory and bash as shell. `/srv/data` must be owned by `runner`, group `svc`."
Goal: `id runner` shows primary group `svc`; `/srv/data` is `runner:svc`; runner can log in with `su - runner`.
