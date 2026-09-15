    create function public.order_count() returns bigint language sql stable security definer set search_path = '' as $$ select count(*) from public.orders $$;
