## 1
GoTrue is telling you exactly what it wants: a confirmed email. Whether confirmation is required is a project setting, not a per-user thing. Local project dir: `~/.k8s-wargame/supabase/project/supabase/config.toml`.
## 2
Look at `[auth.email]` → `enable_confirmations`. Confirming users by hand in `auth.users` does not fix *future* signups.
## 3
Set `enable_confirmations = false`, then `cd ~/.k8s-wargame/supabase/project && supabase stop && supabase start` (the container only reads config at start). Then retry signup + sign-in.
