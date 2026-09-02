Tag typo `redis:7-alpne` → image can't be pulled.
    sed -i '' 's/7-alpne/7-alpine/' ~/.k8s-wargame/docker/10-image-tag/compose.yaml && docker compose -f ~/.k8s-wargame/docker/10-image-tag/compose.yaml up -d
