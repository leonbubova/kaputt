source ../../../lib/common.sh; source ../lib.sh
R DEL cache:home >/dev/null; R RPUSH cache:home stale junk >/dev/null
