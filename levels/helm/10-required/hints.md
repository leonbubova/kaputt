## 1
The error message after `execution error at (...)` is written by the chart author. Read it: it tells you which value is missing.
## 2
`required` aborts rendering when a value is empty. Chart defaults (`values.yaml`) don't set it; `values-prod.yaml` does. Preview: `helm template shop ./shop -f values-prod.yaml`.
## 3
`helm install shop ./shop -n wg-helm -f values-prod.yaml`
