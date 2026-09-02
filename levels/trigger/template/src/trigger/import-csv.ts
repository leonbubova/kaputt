import { task, metadata } from "@trigger.dev/sdk";

// the dashboard shows metadata.progress (0-100) and metadata.rows while this runs
export const importCsv = task({
  id: "import-csv",
  run: async (payload: { rows: number }) => {
    const batch = 100;
    let done = 0;
    metadata.set("progress", 0).set("rows", 0);
    while (done < payload.rows) {
      const n = Math.min(batch, payload.rows - done);
      done += n;
      metadata.set("rows", done).set("progress", Math.round((done / payload.rows) * 100));
    }
    return { imported: done };
  },
});
