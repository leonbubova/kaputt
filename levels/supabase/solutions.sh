# machine-applied solutions, one function per level — used by run-all.sh only
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
SB_X="analytics,vector,imgproxy,pooler,edge-runtime"
s01(){ cat > "$SB_PROJECT/supabase/migrations/20240901100000_notes.sql" <<'SQL'
create table public.notes (id bigint generated always as identity primary key, body text not null, created_at timestamptz not null default now());
SQL
       (cd "$SB_PROJECT" && supabase migration up); }
s02(){ printf "insert into public.notes (body) values ('one'), ('two'), ('three');\n" > "$SB_PROJECT/supabase/seed.sql"; (cd "$SB_PROJECT" && supabase db reset); sb_wait_ready; sb_write_env; }
s03(){ sql 'create policy "public read" on public.notes for select to anon using (true)'; }
s04(){ sql 'create policy "public write" on public.notes for insert to anon with check (true)'; }
s05(){ sql "create function public.greet(name text) returns text language sql immutable as \$\$ select 'hello, ' || name \$\$"; }
s06(){ sql "insert into storage.buckets (id, name, public) values ('uploads', 'uploads', true)"; }
s07(){ sql 'alter policy "faq is public" on public.faq to anon, authenticated'; }
s08(){ sql 'alter policy "sign the book" on public.guestbook with check (true)'; }
s09(){ sql 'grant select on table public.products to anon, authenticated'; }
s10(){ sqlf <<'SQL'
create function public.set_word_count() returns trigger language plpgsql as $$
begin new.word_count := array_length(regexp_split_to_array(trim(new.body), '\s+'), 1); return new; end $$;
create trigger comments_word_count before insert on public.comments for each row execute function public.set_word_count();
SQL
}
s11(){ sqlf <<'SQL'
create or replace function public.set_slug() returns trigger language plpgsql as $$
begin new.slug := lower(regexp_replace(trim(new.title), '[^a-zA-Z0-9]+', '-', 'g')); return new; end $$;
SQL
}
s12(){ sql 'drop trigger tasks_updated_at on public.tasks; create trigger tasks_updated_at before update on public.tasks for each row execute function public.set_updated_at()'; }
s13(){ sql 'create view public.leaderboard as select name, score from public.players where not banned order by score desc'; }
s14(){ sql 'alter view wg_analytics.top_articles set schema public'; }
s15(){ sql "update storage.buckets set public = true where id = 'avatars'"; }
s16(){ sql "create function public.order_count() returns bigint language sql stable security definer set search_path = '' as \$\$ select count(*) from public.orders \$\$"; }
s17(){ sql 'alter function public.event_count() security definer'; }
s18(){ sql 'alter publication supabase_realtime add table public.rooms'; }
s19(){ sql 'alter publication supabase_realtime add table public.messages'; }
s20(){ cfg="$SB_PROJECT/supabase/config.toml"; sed -i.bak '/^\[auth.email\]/,/^\[/ s/^enable_confirmations = true/enable_confirmations = false/' "$cfg"; rm -f "$cfg.bak"
       (cd "$SB_PROJECT" && supabase stop && supabase start -x "$SB_X"); sb_wait_ready; sb_write_env; }
s21(){ sed -i.bak -e 's/NOT NUL unique/NOT NULL unique/' -e 's/(3, 2)/(2, 2)/' "$SB_PROJECT"/supabase/migrations/*_tags.sql; rm -f "$SB_PROJECT"/supabase/migrations/*.bak; (cd "$SB_PROJECT" && supabase db reset); sb_wait_ready; sb_write_env; }
s22(){ sql 'create index page_views_user_id_idx on public.page_views (user_id)'; }
s23(){ sql 'alter table public.waitlist add constraint waitlist_email_key unique (email)'; }
s24(){ sql 'delete from public.subscribers a using public.subscribers b where a.email = b.email and a.id > b.id; alter table public.subscribers add constraint subscribers_email_key unique (email)'; }
