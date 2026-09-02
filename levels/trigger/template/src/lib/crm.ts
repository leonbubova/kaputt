// the CRM API times out on the first two calls after a cold start — retries fix it
let calls = 0;
export async function crmUpsert(contact: { id: string; email: string }) {
  calls++;
  if (calls % 3 !== 0) {
    throw new Error("CRM API timeout (ETIMEDOUT)");
  }
  return { ok: true, id: contact.id };
}
