# machine-applied solutions — used by test/run-all.sh only. Restores the template's version of the file.
_TR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd); _APP=${WG_APP:-${WG_TRIG:-$HOME/.k8s-wargame/trigger}/app}
_restore(){ cp "$_TR/template/$1" "$_APP/$1"; }
s01(){ sed -i.bak 's/hello, world/hello, trigger/' "$_APP/src/trigger/hello.ts" && rm -f "$_APP/src/trigger/hello.ts.bak"; }
s02(){ printf 'import { task } from "@trigger.dev/sdk";\n\nexport const sayHi = task({\n  id: "say-hi",\n  run: async () => {\n    return { hi: true };\n  },\n});\n' > "$_APP/src/trigger/say-hi.ts"; }
s03(){ printf 'import { task } from "@trigger.dev/sdk";\n\nexport const greet = task({\n  id: "greet",\n  run: async (payload: { name: string }) => {\n    return { greeting: `hello, ${payload.name}` };\n  },\n});\n' > "$_APP/src/trigger/greet.ts"; }
s04(){ printf 'import { task, logger } from "@trigger.dev/sdk";\n\nexport const greet = task({\n  id: "greet",\n  run: async (payload: { name: string }) => {\n    logger.info(`greeting ${payload.name}`);\n    return { greeting: `hello, ${payload.name}` };\n  },\n});\n' > "$_APP/src/trigger/greet.ts"; }
s05(){ printf 'import { task } from "@trigger.dev/sdk";\nimport { users } from "../lib/db.js";\n\nexport const countUsers = task({\n  id: "count-users",\n  run: async () => {\n    return { users: users.size };\n  },\n});\n' > "$_APP/src/trigger/count-users.ts"; }
s06(){ printf 'import { processOrder } from "../trigger/process-order.js";\n\nexport async function placeOrder(orderId: string) {\n  const handle = await processOrder.trigger({ orderId });\n  return { runId: handle.id };\n}\n' > "$_APP/src/api/orders.ts"; }
s07(){ printf 'import { task } from "@trigger.dev/sdk";\nimport { crmUpsert } from "../lib/crm.js";\n\nexport const pingCrm = task({\n  id: "ping-crm",\n  retry: { maxAttempts: 4 },\n  run: async () => {\n    return await crmUpsert({ id: "usr_1", email: "ana@example.com" });\n  },\n});\n' > "$_APP/src/trigger/ping-crm.ts"; }
s08(){ _restore src/trigger/notify-user.ts; }
s09(){ _restore src/trigger/charge-card.ts; }
s10(){ _restore trigger.config.ts; }
s11(){ _restore src/trigger/sync-crm.ts; }
s12(){ _restore src/trigger/daily-digest.ts; }
s13(){ _restore src/api/signup.ts; }
s14(){ _restore src/trigger/send-campaign.ts; }
s15(){ _restore src/trigger/payout.ts; }
s16(){ _restore trigger.config.ts; }
s17(){ _restore src/trigger/process-refund.ts; }
s18(){ _restore src/api/checkout.ts; }
s19(){ _restore src/trigger/sync-crm.ts; }
s20(){ _restore src/trigger/import-csv.ts; }
s21(){ _restore src/trigger/generate-report.ts; }
s22(){ _restore src/trigger/generate-report.ts; }
s23(){ _restore src/trigger/resize-images.ts; }
s24(){ _restore src/trigger/queues.ts; }
s25(){ _restore src/trigger/sync-shopify.ts; }
s26(){ _restore src/api/stripe-webhook.ts; }
s27(){ _restore src/api/campaign.ts; }
s28(){ _restore src/api/reports.ts; }
s29(){ _restore src/trigger/send-followup.ts; }
s30(){ _restore src/trigger/import-csv.ts; }
s31(){ _restore src/trigger/payout.ts; }
