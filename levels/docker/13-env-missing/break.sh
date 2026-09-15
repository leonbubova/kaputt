source ../../../lib/common.sh; source ../lib.sh
setup_work
docker rm -f wg-api >/dev/null 2>&1
docker build -q -t wg-api:1.0 "$WORK" >/dev/null
docker run -d --name wg-api -e API_TOKN=s3cret-token -e LOG_LEVEL=info wg-api:1.0 >/dev/null
