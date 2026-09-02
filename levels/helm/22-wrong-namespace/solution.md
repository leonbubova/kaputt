`helm list -A` shows `shop` in `wg-helm-staging`.
    helm uninstall shop -n wg-helm-staging && helm install shop ./shop -n wg-helm
