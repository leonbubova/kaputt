## 1
A trigger is two things: the function (*what* to do) and the trigger definition (*when* it fires — BEFORE or AFTER, on which event). A function that runs without error but changes nothing usually points at the *when*. Look at the trigger definition, not just the function: `select tgname, pg_get_triggerdef(oid) from pg_trigger where tgrelid='public.tasks'::regclass;`
## 2
A row-level trigger can only modify `NEW` when it runs *BEFORE* the operation. In an AFTER trigger the row is already written; changing `NEW` there is a no-op.
## 3
`drop trigger tasks_updated_at on public.tasks; create trigger tasks_updated_at before update on public.tasks for each row execute function public.set_updated_at();`
