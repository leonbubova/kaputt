`web` is only on `wg-front`, `app` only on `wg-back` — no shared network, no DNS.
    # compose.yaml: app.networks: [back, front]   then
    docker compose -f ~/.k8s-wargame/docker/15-networks/compose.yaml up -d
