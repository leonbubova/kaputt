# shared by the terraform track's break.sh / check.sh — source after lib/common.sh
WGTF=${WG_TF_DIR:-$HOME/.k8s-wargame/terraform}; APP=$WGTF/app
export PATH="$WGTF/bin:$PATH" TF_CLI_CONFIG_FILE="$WGTF/cli.tfrc" TF_PLUGIN_CACHE_DIR="$WGTF/plugin-cache" TF_IN_AUTOMATION=1 TF_INPUT=0 CHECKPOINT_DISABLE=1
tf()  { (cd "$APP" && terraform -chdir="$APP" "$@" -no-color 2>&1); }
tfq() { (cd "$APP" && terraform -chdir="$APP" "$@" >/dev/null 2>&1); }
wf()  { mkdir -p "$(dirname "$APP/$1")"; cat > "$APP/$1"; }          # wf path <<EOF
tfinit() { tfq init -input=false || { echo "terraform init failed" >&2; exit 1; }; }
need_app() { [ -d "$APP" ] && ls "$APP"/*.tf >/dev/null 2>&1 || fail "no terraform config at $APP — wg reset"; }
tail_err() { printf '%s\n' "$1" | grep -v '^$' | tail -n 8 | sed 's/^/    /'; }
# init + apply; prints error tail and fails
tf_apply() { local o; o=$(tf init -input=false) || { tail_err "$o"; fail "terraform init fails"; }
  o=$(tf apply -auto-approve -input=false) || { tail_err "$o"; fail "terraform apply fails"; }; }
# wipe out/ + state, then init+apply → proves the config works from scratch
fresh_apply() { rm -rf "$APP/out" "$APP/terraform.tfstate" "$APP/terraform.tfstate.backup"; tf_apply; }
plan_clean() { (cd "$APP" && terraform -chdir="$APP" plan -detailed-exitcode -input=false >/dev/null 2>&1); }
in_state() { tf state list | grep -qF -- "$1"; }
outraw() { tf output -raw "$1"; }
fcontent() { [ -f "$APP/$1" ] || fail "$1 missing"; cat "$APP/$1"; }
