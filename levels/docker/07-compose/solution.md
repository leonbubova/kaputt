    cat > ~/.k8s-wargame/docker/07-compose/compose.yaml <<'Y'
    services:
      web:   {image: nginx:1.27-alpine, container_name: wg-web, ports: ["18007:80"]}
      cache: {image: redis:7-alpine, container_name: wg-cache}
    Y
    docker compose -p wg -f ~/.k8s-wargame/docker/07-compose/compose.yaml up -d
