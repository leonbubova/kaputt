source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
sqlf <<'SQL' >/dev/null
create table public.articles (id serial primary key, title text not null, views int not null default 0, published boolean not null default true);
alter table public.articles enable row level security;
insert into public.articles (title, views, published) values ('Intro', 120, true), ('Deep dive', 340, true), ('Draft', 5, false), ('Changelog', 80, true);
create schema wg_analytics;
create view wg_analytics.top_articles as select id, title, views from public.articles where published order by views desc;
grant usage on schema wg_analytics to anon, authenticated;
grant select on wg_analytics.top_articles to anon, authenticated;
SQL
