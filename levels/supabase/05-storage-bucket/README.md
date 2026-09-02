# a storage bucket is a row in storage.buckets, and public is a flag on it
Lesson: Supabase Storage keeps file bytes on disk (or S3) but all of its bookkeeping in Postgres: schema `storage`, tables `buckets` and `objects`. A bucket is a row. Whether files in it can be fetched without any auth header is the `public` boolean on that row. Nothing else has to be configured.
That means three doors lead to the same place: Studio's "New bucket" dialog, the Storage API (`POST /storage/v1/bucket` with the service key), or a plain `insert` in psql. Studio and the API write the row for you; SQL writes it directly.
Two URL shapes matter. Uploads go to `/storage/v1/object/<bucket>/<path>` and need a key. Public reads go to `/storage/v1/object/public/<bucket>/<path>` — and only work when the bucket row says `public = true`.
    select id, public from storage.buckets;                                              buckets that exist (wg shell)
    insert into storage.buckets (id, name, public) values ('b', 'b', true);              create a public bucket
    curl -s -X POST "$API_URL/storage/v1/object/b/a.txt" -H "Authorization: Bearer $SERVICE_ROLE_KEY" -H 'Content-Type: text/plain' --data hi
    curl -s "$API_URL/storage/v1/object/public/b/a.txt"                                  read it, no auth
Try it first: `wg shell`, then `\d storage.buckets` — the `public` column is right there.
Your task: "Users will upload attachments. Create a storage bucket `uploads` that serves files publicly: `GET /storage/v1/object/public/uploads/<path>` must work without any auth header."
Goal: bucket `uploads` exists and is public; uploads with the service key are then readable at the public URL.
Check yourself:  wg check      stuck?  wg hint
