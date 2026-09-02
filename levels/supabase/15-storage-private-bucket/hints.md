## 1
`/object/public/...` only works for buckets flagged public. Look at the bucket: `select id, public from storage.buckets;`
## 2
A private bucket needs signed URLs or an Authorization header; a public bucket serves objects to anyone. The frontend expects the latter.
## 3
`update storage.buckets set public = true where id = 'avatars';` (Studio: bucket settings → Public bucket).
