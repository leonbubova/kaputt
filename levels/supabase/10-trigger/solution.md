    create function public.set_word_count() returns trigger language plpgsql as $$
    begin new.word_count := array_length(regexp_split_to_array(trim(new.body), '\s+'), 1); return new; end $$;
    create trigger comments_word_count before insert on public.comments for each row execute function public.set_word_count();
