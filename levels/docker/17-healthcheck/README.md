# app never starts, waits for the database forever
"`docker compose up -d` in `~/.k8s-wargame/docker/17-healthcheck/` hangs on `wg-db` and finally says 'dependency failed to start'. Redis itself answers just fine."
Goal: `wg-db` is `healthy` and `wg-app` is running. Keep `depends_on` with the health condition — the app must not start before the db is ready.
