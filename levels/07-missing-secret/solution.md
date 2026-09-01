Deployment references `db-credentials`, secret is `db-credential`.
    kubectl create secret generic db-credentials --from-literal=password=s3cret
(or edit the deployment's secretKeyRef name)
