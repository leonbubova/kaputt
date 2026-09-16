`values-launch.yaml` sets a non-existent image tag. Roll back, fix the tag, upgrade with auto-rollback.
    helm rollback shop 1 -n wg-helm
    sed -i "" 's/1.27-alpine-perl-slim/1.27-alpine/' values-launch.yaml
    helm upgrade shop ./shop -n wg-helm -f values-launch.yaml --rollback-on-failure --wait
