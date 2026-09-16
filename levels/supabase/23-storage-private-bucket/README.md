# avatars are broken images
"Profile pictures are uploaded to bucket `avatars` and rendered via `GET /storage/v1/object/public/avatars/team/mo.txt`. Every one of them shows as `{"statusCode":"404","error":"Bucket not found"}`, although the file is right there in Studio." Goal: that URL returns the file (200) without any auth header.
