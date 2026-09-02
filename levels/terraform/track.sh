# track: terraform with local-only providers (local, random, null). Play area: ~/.k8s-wargame/terraform/app
WGTF=${WG_TF_DIR:-$HOME/.k8s-wargame/terraform}
TF_APP=$WGTF/app
export PATH="$WGTF/bin:$PATH" TF_CLI_CONFIG_FILE="$WGTF/cli.tfrc" TF_PLUGIN_CACHE_DIR="$WGTF/plugin-cache"
export TF_IN_AUTOMATION=1 TF_INPUT=0 CHECKPOINT_DISABLE=1
TF_PROVIDERS='local = { source = "hashicorp/local", version = "~> 2.5" }
    random = { source = "hashicorp/random", version = "~> 3.6" }
    null = { source = "hashicorp/null", version = "~> 3.2" }'
tf_install() {
  command -v terraform >/dev/null && return 0
  echo "terraform missing — trying brew…"; brew install hashicorp/tap/terraform >/dev/null 2>&1 || true
  command -v terraform >/dev/null && return 0
  local v=1.9.8 os arch; os=$(uname -s | tr 'A-Z' 'a-z'); arch=$(uname -m); case $arch in x86_64) arch=amd64;; aarch64) arch=arm64;; esac
  echo "brew failed — downloading terraform $v ($os/$arch) to $WGTF/bin"; mkdir -p "$WGTF/bin"
  curl -fsSLo "$WGTF/bin/tf.zip" "https://releases.hashicorp.com/terraform/$v/terraform_${v}_${os}_${arch}.zip" || { echo "download failed" >&2; return 1; }
  (cd "$WGTF/bin" && unzip -oq tf.zip terraform && rm -f tf.zip); command -v terraform >/dev/null
}
tf_mirror() {  # pre-fetch providers once → play-time init is offline
  local plat tmp; plat=$(terraform version | awk '/^on /{print $2}')
  mkdir -p "$WGTF/mirror" "$WGTF/plugin-cache"
  cat > "$WGTF/cli.tfrc" <<T
plugin_cache_dir = "$WGTF/plugin-cache"
provider_installation {
  filesystem_mirror { path = "$WGTF/mirror" }
}
T
  if [ -d "$WGTF/mirror/registry.terraform.io/hashicorp/kubernetes" ] && [ -d "$WGTF/mirror/registry.terraform.io/hashicorp/local" ] \
     && [ -d "$WGTF/mirror/registry.terraform.io/hashicorp/random" ] && [ -d "$WGTF/mirror/registry.terraform.io/hashicorp/null" ]; then echo "provider mirror ok"; return 0; fi
  echo "mirroring providers (one-time download)…"; tmp=$(mktemp -d)
  printf 'terraform {\n  required_providers {\n    %s\n  }\n}\n' "$TF_PROVIDERS" > "$tmp/versions.tf"
  (cd "$tmp" && terraform providers mirror -platform="$plat" "$WGTF/mirror" >/dev/null) || { echo "provider mirror failed (internet needed once)" >&2; rm -rf "$tmp"; return 1; }
  rm -rf "$tmp"
}
track_start() {
  tf_install || return 1; echo "using $(terraform version | head -1)"
  tf_mirror || return 1
  printf 'export PATH="%s/bin:$PATH" TF_CLI_CONFIG_FILE="%s/cli.tfrc" TF_PLUGIN_CACHE_DIR="%s/plugin-cache" CHECKPOINT_DISABLE=1\n' "$WGTF" "$WGTF" "$WGTF" > "$WGTF/env.sh"
  mkdir -p "$TF_APP"
  echo "shell env: source $WGTF/env.sh   (or: wg shell)"
}
track_stop()  { rm -rf "$TF_APP" "$WGTF/mirror" "$WGTF/plugin-cache" "$WGTF/cli.tfrc" "$WGTF/env.sh" "$WGTF/bin"; }
track_ready() { command -v terraform >/dev/null && [ -f "$WGTF/cli.tfrc" ] && [ -d "$WGTF/mirror/registry.terraform.io/hashicorp/local" ]; }
track_wipe()  {  # before each level: fresh copy of the template play area
  rm -rf "$TF_APP"; mkdir -p "$TF_APP"; cp -R "$WG_ROOT/levels/terraform/template/." "$TF_APP/"
}
track_shell() { mkdir -p "$TF_APP"; cd "$TF_APP" && exec "${SHELL:-bash}"; }
