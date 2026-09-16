source ../../../lib/common.sh; source ../lib.sh
docker rm -f wg-report >/dev/null 2>&1
docker run -d --name wg-report --memory=32m --memory-swap=32m alpine:3.20 sh -c 'echo "generating report…"; dd if=/dev/zero of=/dev/shm/report.bin bs=1M count=48 2>/dev/null || { echo "FATAL: report generation crashed" >&2; exit 1; }; echo "report done"; exec sleep infinity' >/dev/null
