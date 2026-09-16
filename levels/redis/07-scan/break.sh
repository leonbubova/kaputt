source ../../../lib/common.sh; source ../lib.sh
R FLUSHALL >/dev/null
i=1; { while [ $i -le 300 ]; do echo "SET log:$i line$i"; i=$((i+1)); done; echo "SET note:hidden-4f2c needle"; } | docker exec -i "$RC" redis-cli >/dev/null
