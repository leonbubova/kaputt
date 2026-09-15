nginx:2.0-alpine doesn't exist → ImagePullBackOff, rollout stalls (maxUnavailable protects the old pods).
    kubectl rollout undo deploy/web && kubectl rollout status deploy/web
