// on-call alerting (Slack webhook in prod, recorded in memory here)
export const alerts: string[] = [];
export async function sendAlert(message: string) {
  alerts.push(message);
}
