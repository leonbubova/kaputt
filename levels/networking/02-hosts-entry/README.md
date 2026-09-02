# api.internal doesn't resolve — scripts can't find the API host
Internal tooling refers to the host `api.internal`, which should point at this box (127.0.0.1).
Right now the name doesn't resolve at all. Add a hosts entry so it maps to 127.0.0.1.
