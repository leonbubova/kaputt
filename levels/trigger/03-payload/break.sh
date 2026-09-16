source "$WG_ROOT/lib/common.sh"; source ../lib.sh
cat > "$WG_APP/src/trigger/greet.ts" <<'T'
import { task } from "@trigger.dev/sdk";

export const greet = task({
  id: "greet",
  run: async () => {
    return { greeting: "hello" };
  },
});
T
