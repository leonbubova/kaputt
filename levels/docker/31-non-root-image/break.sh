source ../../../lib/common.sh; source ../lib.sh
setup_work
docker rmi -f wg-tool:2 >/dev/null 2>&1 || true
