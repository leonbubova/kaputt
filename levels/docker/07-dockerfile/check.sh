source ../../../lib/common.sh; source ../lib.sh
docker image inspect wg-hello:1 >/dev/null 2>&1 || fail "no image wg-hello:1 yet — write the Dockerfile, then: docker build -t wg-hello:1 ."
out=$(docker run --rm wg-hello:1 2>&1 || true)
echo "$out" | grep -q "built into the image" || fail "a container from wg-hello:1 prints '$out' — it should print the text of hello.txt (COPY + CMD cat)"
ok "wg-hello:1 built and prints hello.txt — your first own image"
