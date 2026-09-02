source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
sql "drop function if exists public.greet(text)" >/dev/null
