source "$WG_ROOT/lib/common.sh"; source ../lib.sh
cat > "$WG_APP/src/trigger/import-csv.ts" <<'T'
import { task, metadata } from "@trigger.dev/sdk";

// the dashboard shows metadata.progress (0-100) and metadata.rows while this runs
export const importCsv = task({
  id: "import-csv",
  run: async (payload: { rows: number }) => {
    const batch = 100;
    let done = 0;
    const progress = { progress: 0, rows: 0 };
    metadata.set("progress", progress.progress).set("rows", progress.rows);
    while (done < payload.rows) {
      const n = Math.min(batch, payload.rows - done);
      done += n;
      progress.rows = done;
      progress.progress = Math.round((done / payload.rows) * 100);
    }
    return { imported: done };
  },
});
T
