// in-memory stand-in for the shop database
export type Order = { id: string; userId: string; totalCents: number; email: string };
export type User = { id: string; email: string; name: string };

export const orders = new Map<string, Order>([
  ["ord_1001", { id: "ord_1001", userId: "usr_1", totalCents: 4999, email: "ana@example.com" }],
  ["ord_1002", { id: "ord_1002", userId: "usr_2", totalCents: 12000, email: "bo@example.com" }],
]);

export const users = new Map<string, User>([
  ["usr_1", { id: "usr_1", email: "ana@example.com", name: "Ana" }],
  ["usr_2", { id: "usr_2", email: "bo@example.com", name: "Bo" }],
]);

export const charges: { orderId: string; amountCents: number }[] = [];
export const refunds: { orderId: string; amountCents: number }[] = [];
export const sentEmails: { to: string; template: string }[] = [];

export async function sendEmail(to: string, template: string) {
  sentEmails.push({ to, template });
}
