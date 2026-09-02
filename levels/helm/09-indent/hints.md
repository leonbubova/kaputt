## 1
Templates are plain text substitution — Helm pastes values into the template and the result must still be valid YAML, where indentation *is* structure. A multi-line value pasted in the wrong column breaks the parse. Look at what actually gets rendered: `helm template web ./web --debug` (prints the YAML even when it fails). Find the `data:` line of the ConfigMap.
## 2
`indent` adds spaces but no newline; `{{-` eats the newline before it. Together the first key lands on the `data:` line. `nindent` = newline + indent.
## 3
In `templates/configmap.yaml` replace `| indent 2` with `| nindent 2`, then `helm install web ./web -n wg-helm`.
