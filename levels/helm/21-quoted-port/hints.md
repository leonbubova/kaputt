## 1
Helm only produces text; the API server then validates every field against the resource schema — including its *type*. A ValidationError means the YAML parsed fine but a field carries the wrong kind of value, and the error names the exact field path. Render it: `helm template web ./web | grep -n containerPort`.
## 2
`quote` turns `80` into `"80"`. YAML `"80"` is a string; `containerPort` must be an integer. (`targetPort` accepts strings — those mean *named* ports.)
## 3
Drop `| quote` (or use `| int`) in `templates/deployment.yaml`, then `helm install web ./web -n wg-helm`.
