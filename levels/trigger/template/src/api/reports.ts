import { generateReport } from "../trigger/generate-report.js";

// POST /api/reports — kicks off the monthly report, returns the run id for polling
export async function requestReport(month: string) {
  const handle = await generateReport.trigger({ month });
  return { runId: handle.id };
}
