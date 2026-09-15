# a place for files
Ticket: "Users will upload attachments. Create a storage bucket `uploads` that serves files publicly: `GET /storage/v1/object/public/uploads/<path>` must work without any auth header."
Goal: bucket `uploads` exists and is public; uploads with the service key are then readable at the public URL.
