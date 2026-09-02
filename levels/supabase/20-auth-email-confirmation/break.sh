source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
cfg="$SB_PROJECT/supabase/config.toml"
if ! awk '/^\[auth.email\]/{f=1;next} /^\[/{f=0} f && /^enable_confirmations = true/{found=1} END{exit !found}' "$cfg"; then
  awk '/^\[auth.email\]/{f=1} /^\[/ && !/^\[auth.email\]/{f=0} f && /^enable_confirmations = /{sub(/= .*/, "= true")} {print}' "$cfg" > "$cfg.tmp" && mv "$cfg.tmp" "$cfg"
fi
# gotrue only reads its config at start → restart the stack (keeps data volumes)
(cd "$SB_PROJECT" && supabase stop >/dev/null 2>&1 && supabase start -x analytics,vector,imgproxy,pooler,edge-runtime >/dev/null 2>&1) || { echo "restart failed" >&2; exit 1; }
sb_write_env
