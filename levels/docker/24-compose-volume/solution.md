    # compose.yaml: notes.volumes: ["notes:/notes"] and top level volumes: {notes: {name: wg-notes}}
    docker compose -f ~/.k8s-wargame/docker/24-compose-volume/compose.yaml up -d
