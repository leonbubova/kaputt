Dependency condition is `cache.enabled`; `values-prod.yaml` sets `cahce.enabled` → condition stays false, subchart never rendered.
    sed -i "" 's/^cahce:/cache:/' values-prod.yaml && helm upgrade shop ./shop -n wg-helm -f values-prod.yaml
