Trigger is `AFTER UPDATE`; modifying NEW in an AFTER trigger has no effect. Must be BEFORE.
    drop trigger tasks_updated_at on public.tasks;
    create trigger tasks_updated_at before update on public.tasks for each row execute function public.set_updated_at();
