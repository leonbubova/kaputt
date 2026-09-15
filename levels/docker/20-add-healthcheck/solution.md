    # compose.yaml, under web:
    #   healthcheck: {test: ["CMD", "wget", "-qO-", "http://localhost/"], interval: 2s, timeout: 2s, retries: 3}
    docker compose -f ~/.k8s-wargame/docker/20-add-healthcheck/compose.yaml up -d
