source ../../../lib/common.sh; source ../lib.sh
docker rm -f wg-keeper >/dev/null 2>&1; docker volume rm -f wg-data wg-try >/dev/null 2>&1; true
