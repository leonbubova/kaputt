## 1
A missing value normally renders as nothing, silently. The `required` function turns that into a hard stop: `{{ required "message" .Values.xxx }}` prints the value if set and aborts rendering with your message if it is empty.
## 2
In `templates/configmap.yaml` replace `{{ .Values.domain }}` with `{{ required "domain is required" .Values.domain }}`. Check both ways: `helm template shop ./shop` (must fail) and `helm template shop ./shop -f values-prod.yaml` (must render).
## 3
`helm install shop ./shop -n wg-helm -f values-prod.yaml`
