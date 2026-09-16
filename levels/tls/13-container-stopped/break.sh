source ../../../lib/common.sh; source ../lib.sh
good_conf
docker stop wg-tls >/dev/null 2>&1 || true
