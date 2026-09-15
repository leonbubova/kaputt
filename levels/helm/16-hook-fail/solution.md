Hook Job runs `/bin/bash` in busybox — the binary doesn't exist, the job fails, helm aborts the install.
    sed -i "" 's#/bin/bash#/bin/sh#' web/templates/migrate-job.yaml
    helm uninstall web -n wg-helm; helm install web ./web -n wg-helm
