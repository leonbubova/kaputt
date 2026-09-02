source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
mdir="$SB_PROJECT/supabase/migrations"; mkdir -p "$mdir"; rm -f "$mdir"/*.sql
cat > "$mdir/20240901120000_articles.sql" <<'SQL'
create table public.articles (
  id serial primary key,
  title text not null,
  body text,
  created_at timestamptz not null default now()
);
alter table public.articles enable row level security;
create policy "read" on public.articles for select to anon, authenticated using (true);
insert into public.articles (title, body) values ('Hello', 'first post'), ('Tags are coming', 'soon');
SQL
cat > "$mdir/20240902090000_tags.sql" <<'SQL'
create table public.tags (
  id serial primary key,
  name text NOT NUL unique
);
create table public.article_tags (
  article_id int references public.articles(id) on delete cascade,
  tag_id int references public.tags(id) on delete cascade,
  primary key (article_id, tag_id)
);
alter table public.tags enable row level security;
alter table public.article_tags enable row level security;
create policy "read" on public.tags for select to anon, authenticated using (true);
create policy "read" on public.article_tags for select to anon, authenticated using (true);
insert into public.tags (name) values ('postgres'), ('supabase');
insert into public.article_tags values (1, 1), (3, 2);
SQL
