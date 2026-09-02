source ../../../lib/common.sh; source ../lib.sh
docker rm -f wg-a wg-b >/dev/null 2>&1; docker network rm wg-net >/dev/null 2>&1; true
