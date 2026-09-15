source "$WG_ROOT/lib/common.sh"; source ../lib.sh
cat > "$WG_APP/trigger.config.ts" <<'C'
import { defineConfig } from "@trigger.dev/sdk";

export default defineConfig({
  project: "proj_wgshop00000000000000",
  runtime: "node",
  logLevel: "log",
  // every task may run at most 5 minutes unless it says otherwise
  maxDuration: 300,
  dirs: ["./src/trigger"],
});
C
