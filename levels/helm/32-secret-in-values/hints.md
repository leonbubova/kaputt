## 1
Everything helm renders is stored in the release Secret — values and manifest. A password that goes through values is a password in `helm get`. Read `templates/secret.yaml` and `templates/deployment.yaml`: the chart already supports an *existing* Secret.
## 2
Create the Secret yourself, outside helm: `kubectl create secret generic shop-db-ext -n wg-helm --from-literal=password=s3cret-hunter2`.
## 3
Point the chart at it and remove the default: `--set db.existingSecret=shop-db-ext`, and delete the `password:` line from `values.yaml` (`--all` shows chart defaults too). Then `helm upgrade shop ./shop -n wg-helm`.
