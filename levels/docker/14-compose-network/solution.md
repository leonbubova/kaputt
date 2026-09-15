    # compose.yaml: add `networks: [back]` to web and app, and at top level `networks: {back: {name: wg-back}}`
    docker compose -f ~/.k8s-wargame/docker/14-compose-network/compose.yaml up -d
