Password is a chart value → stored in the release. Move it into a Secret helm doesn't manage.
    kubectl create secret generic shop-db-ext -n wg-helm --from-literal=password=s3cret-hunter2
    sed -i "" '/^  password:/d' shop/values.yaml
    helm upgrade shop ./shop -n wg-helm --set db.existingSecret=shop-db-ext --wait
