# password from a secret, into env
Ticket: "`api` reads its DB password from the env var `DB_PASSWORD`, but the value must never appear in a manifest. Create Secret `db-credentials` in `wg` with key `password` = `s3cret`, and a pod `api` (image `busybox:1.36`, keep it running) that takes `DB_PASSWORD` from exactly that secret key."
Goal: `kubectl exec api -- sh -c 'echo $DB_PASSWORD'` prints `s3cret`, and the pod spec contains no plain-text password.
