## 1
Work the database does on its own at write time is a trigger: a function that returns `trigger` plus a definition saying when it fires. A `BEFORE INSERT … FOR EACH ROW` trigger sees the incoming row as `new` and may change it before it is stored. See what exists: `\d public.comments` (Triggers section).
## 2
The function: `create function public.set_word_count() returns trigger language plpgsql as $$ begin new.word_count := array_length(regexp_split_to_array(trim(new.body), '\s+'), 1); return new; end $$;` — `return new` hands the (changed) row back.
## 3
Wire it: `create trigger comments_word_count before insert on public.comments for each row execute function public.set_word_count();` — then POST a comment and `select body, word_count from comments;`
