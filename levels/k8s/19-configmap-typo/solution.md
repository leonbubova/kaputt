Logs: `unknown directive "lissen"`. Fix the ConfigMap, then restart:
    kubectl edit cm web-config      # lissen → listen
    kubectl rollout restart deploy/web
