source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
sql "insert into storage.buckets (id, name, public) values ('avatars', 'avatars', false)" >/dev/null
rest_svc POST "/storage/v1/object/avatars/team/mo.txt" -H "Content-Type: text/plain" --data 'avatar-of-mo' >/dev/null || { echo "upload failed ($(rest_code))" >&2; exit 1; }
[ "$(rest_code)" = 200 ] || { echo "upload failed ($(rest_code))" >&2; exit 1; }
