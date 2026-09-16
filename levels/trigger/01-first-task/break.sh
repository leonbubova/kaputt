source "$WG_ROOT/lib/common.sh"; source ../lib.sh
cat > "$WG_APP/src/trigger/hello.ts" <<'T'
import { task } from "@trigger.dev/sdk";

export const hello = task({
  id: "hello",
  run: async () => {
    return { message: "hello, world" };
  },
});
T
