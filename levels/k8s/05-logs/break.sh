source ../../../lib/common.sh
NOTES="$HOME/.k8s-wargame/k8s"; mkdir -p "$NOTES"; rm -f "$NOTES/word.txt"
$K run talker --image=busybox:1.36 -- sh -c 'echo "talker starting up"; echo "loading settings... done"; echo "the secret word is: tangerine"; echo "ready."; sleep 3600' >/dev/null
