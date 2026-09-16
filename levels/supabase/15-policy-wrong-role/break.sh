source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
sqlf <<'SQL' >/dev/null
create table public.faq (id serial primary key, question text not null, answer text not null);
alter table public.faq enable row level security;
create policy "faq is public" on public.faq for select to authenticated using (true);
insert into public.faq (question, answer) values
 ('How do I reset my password?', 'Use the link on the login page.'),
 ('Can I export my data?', 'Yes, Settings → Export.'),
 ('Is there an API?', 'Yes, see /docs.');
SQL
