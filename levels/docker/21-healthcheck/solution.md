Healthcheck pings port 6380, redis listens on 6379 → always unhealthy → `depends_on: service_healthy` never satisfied.
    sed -i '' 's/"-p", "6380", //' ~/.k8s-wargame/docker/21-healthcheck/compose.yaml && docker compose -f ~/.k8s-wargame/docker/21-healthcheck/compose.yaml up -d
