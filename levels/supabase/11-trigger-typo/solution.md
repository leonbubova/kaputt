Trigger function `set_slug()` references `new.titel` (typo); the column is `title`.
    create or replace function public.set_slug() returns trigger language plpgsql as $$
    begin new.slug := lower(regexp_replace(trim(new.title), '[^a-zA-Z0-9]+', '-', 'g')); return new; end $$;
