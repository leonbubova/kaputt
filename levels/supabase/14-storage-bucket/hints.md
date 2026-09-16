## 1
Buckets are rows in `storage.buckets` — Studio (http://127.0.0.1:54323 → Storage → New bucket, tick "Public"), the Storage API, or plain SQL all work.
## 2
SQL: `insert into storage.buckets (id, name, public) values ('uploads', 'uploads', true);` API: `curl -X POST $API_URL/storage/v1/bucket -H "Authorization: Bearer $SERVICE_ROLE_KEY" -H "Content-Type: application/json" -d '{"id":"uploads","name":"uploads","public":true}'`.
## 3
Test like the check: upload `curl -X POST $API_URL/storage/v1/object/uploads/a.txt -H "Authorization: Bearer $SERVICE_ROLE_KEY" -H "Content-Type: text/plain" --data hi`, then `curl $API_URL/storage/v1/object/public/uploads/a.txt`.
