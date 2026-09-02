source ../../../lib/common.sh; source ../lib.sh
setup_work
docker rmi -f wg-tool:1.0 >/dev/null 2>&1 || true
