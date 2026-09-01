Logs say `FATAL: DB_HOST is not set`. The deployment sets `DB_HOTS` (typo).
    kubectl set env deploy/api DB_HOST=postgres.wg.svc DB_HOTS-
