source ../../../lib/common.sh; source ../lib.sh
setup_work; mkdir -p "$WORK/.cache"
head -c 62914560 /dev/urandom > "$WORK/.cache/build-artifacts.bin"
docker rmi -f wg-app:1.0 >/dev/null 2>&1 || true
docker build -q -t wg-app:1.0 "$WORK" >/dev/null 2>&1
