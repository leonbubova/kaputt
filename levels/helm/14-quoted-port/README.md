# "got string, expected integer"
"Someone made the port configurable and now `helm install web ./web -n wg-helm` is rejected by the API server with a ValidationError."
Chart copy: `~/.k8s-wargame/helm/14-quoted-port/web`. Goal: release `web` deployed, container still declares port 80, page reachable.
