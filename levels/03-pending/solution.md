The pod requests 64 CPUs and 256Gi. No node can satisfy it. Lower requests/limits:
    kubectl set resources deploy/worker --requests=cpu=100m,memory=64Mi --limits=cpu=200m,memory=128Mi
