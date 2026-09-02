`event_count()` is SECURITY INVOKER → runs as `anon` → RLS hides all rows → count 0.
    alter function public.event_count() security definer;
