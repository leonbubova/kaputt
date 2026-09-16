source ../../../lib/common.sh; source ../lib.sh
setup_work; docker rmi -f wg-site:1 >/dev/null 2>&1; docker rm -f wg-site-check >/dev/null 2>&1; true
