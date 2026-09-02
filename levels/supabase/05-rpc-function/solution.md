    create function public.greet(name text) returns text language sql immutable as $$ select 'hello, ' || name $$;
