# customer complains about a failed checkout
"A customer got an error on `/checkout` around the time of the load test. Support needs the `X-Request-Id` of that one failed request for the incident report."
Goal: write the request id (the value only) of the failed `GET /checkout` on `wg-web` into `~/.k8s-wargame/docker/25-find-request/answer.txt`.
