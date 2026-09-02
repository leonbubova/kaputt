source "$WG_ROOT/lib/common.sh"; source ../lib.sh
cat > "$WG_APP/src/api/reports.ts" <<'T'
import { generateReport } from "../trigger/generate-report.js";

// POST /api/reports — kicks off the monthly report, returns the run id for polling
export async function requestReport(month: string) {
  const result = await generateReport.triggerAndWait({ month });
  if (!result.ok) throw new Error("report failed");
  return { runId: result.id, url: result.output.url };
}
T
