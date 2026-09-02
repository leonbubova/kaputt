source ../../../lib/common.sh; source ../lib.sh
docker rm -f wg-worker >/dev/null 2>&1
docker run -d --name wg-worker alpine:3.20 sh -c 'echo "worker $(date +%T): processing queue"; sleep 3600; echo "worker crashed" >&2; exit 1' >/dev/null
