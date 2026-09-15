## 1
Helm's `deployed` only means the rendered YAML was accepted by the API server — it never checks whether that YAML makes sense, and a value the template can't find renders as nothing at all. So look at what helm actually produced: `kubectl describe pod` — what does the image field contain? Compare with `helm get manifest web -n wg-helm`.
## 2
The tag is empty because the template reads a value that does not exist. Missing values render as empty strings, silently. `helm template web ./web | grep image:`.
## 3
Compare the key in `values.yaml` with `.Values.image.tag` in `templates/deployment.yaml`. Fix the key, then `helm upgrade web ./web -n wg-helm`.
