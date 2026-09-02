# machine-applied solutions — used by test/run-all.sh only. Restores the template's version of the file.
_TR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd); _APP=${WG_APP:-${WG_TRIG:-$HOME/.k8s-wargame/trigger}/app}
_restore(){ cp "$_TR/template/$1" "$_APP/$1"; }
s01(){ _restore src/trigger/notify-user.ts; }
s02(){ _restore src/trigger/charge-card.ts; }
s03(){ _restore trigger.config.ts; }
s04(){ _restore src/trigger/sync-crm.ts; }
s05(){ _restore src/trigger/daily-digest.ts; }
s06(){ _restore src/api/signup.ts; }
s07(){ _restore src/trigger/send-campaign.ts; }
s08(){ _restore src/trigger/payout.ts; }
s09(){ _restore trigger.config.ts; }
s10(){ _restore src/trigger/process-refund.ts; }
s11(){ _restore src/api/checkout.ts; }
s12(){ _restore src/trigger/sync-crm.ts; }
s13(){ _restore src/trigger/import-csv.ts; }
s14(){ _restore src/trigger/generate-report.ts; }
s15(){ _restore src/trigger/generate-report.ts; }
s16(){ _restore src/trigger/resize-images.ts; }
s17(){ _restore src/trigger/queues.ts; }
s18(){ _restore src/trigger/sync-shopify.ts; }
s19(){ _restore src/api/stripe-webhook.ts; }
s20(){ _restore src/api/campaign.ts; }
s21(){ _restore src/api/reports.ts; }
s22(){ _restore src/trigger/send-followup.ts; }
s23(){ _restore src/trigger/import-csv.ts; }
s24(){ _restore src/trigger/payout.ts; }
