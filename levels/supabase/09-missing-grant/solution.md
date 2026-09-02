A hardening script revoked all table privileges from `anon`/`authenticated`; policies are useless without GRANT.
    grant select on table public.products to anon, authenticated;
