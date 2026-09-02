`values-prod.yaml` sets `tier: frontend`, which is part of the immutable Deployment selector.
    sed -i "" '/^tier:/d' values-prod.yaml && helm upgrade shop ./shop -n wg-helm -f values-prod.yaml --wait
