The select policy is scoped `to authenticated`; the anon key runs as role `anon`.
    alter policy "faq is public" on public.faq to anon, authenticated;
