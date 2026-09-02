source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
cfg="$SB_PROJECT/supabase/config.toml"
if ! cmp -s "$cfg" "$SB_DIR/config.toml.orig"; then
  cp "$SB_DIR/config.toml.orig" "$cfg"
  (cd "$SB_PROJECT" && supabase stop >/dev/null 2>&1 && supabase start -x analytics,vector,imgproxy,pooler,edge-runtime >/dev/null 2>&1)
  sb_write_env
fi
