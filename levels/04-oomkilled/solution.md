OOMKilled (137): limit 32Mi, app needs 60MB.
    kubectl set resources deploy/cache --limits=memory=128Mi
