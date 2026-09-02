StorageClass `fast-ssd` does not exist; k3s ships `local-path` (default).
    kubectl delete pod db pvc db-data
    kubectl get pvc db-data -o yaml  # (before deleting) → change storageClassName: local-path → apply pvc + pod again
