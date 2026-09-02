# updated_at never changes
"`tasks.updated_at` is supposed to be maintained by a trigger. We PATCH a task (`/rest/v1/tasks?id=eq.1`, `{"done":true}`) and `updated_at` stays at the old value. The trigger exists, no errors anywhere." Goal: any UPDATE through the API bumps `updated_at` automatically (the client must not have to send it).
