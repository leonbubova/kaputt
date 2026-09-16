# secret as a file
Ticket: "The reader service loads its API key from a file, not from env. Create a Secret `api-key` in `wg` with key `token` = `abc123`, and a pod `reader` (image `busybox:1.36`, keep it running) that mounts the secret at `/etc/secret`."
Goal: `kubectl exec reader -- cat /etc/secret/token` prints `abc123`.
