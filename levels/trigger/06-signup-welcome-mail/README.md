# ticket: welcome mail on signup
"`POST /api/signup` must not block on sending mail. Add `src/api/signup.ts` exporting `signup(userId)`: it starts one `send-welcome-email` run with payload `{ userId }` in the background and returns `{ runId }` so the UI can poll." Goal: exactly that, from plain backend code.
