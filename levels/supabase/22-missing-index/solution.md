No index on `page_views.user_id` → sequential scan of 300k rows on every request.
    create index page_views_user_id_idx on public.page_views (user_id);
