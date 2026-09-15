source ../../../lib/common.sh; source ../lib.sh
setup_work
docker compose -f "$WORK/compose.yaml" up -d --pull missing >/dev/null 2>&1 || true
