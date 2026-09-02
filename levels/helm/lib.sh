# helm track helpers — source AFTER lib/common.sh
NS=wg-helm; K="kubectl -n $NS"; H="helm -n $NS"
WGH=${WG_STATE:-$HOME/.k8s-wargame}/helm
# copy ./chart (as <chartname>) plus extra files into the player's work dir $WGH/<level>
stage_chart() { local d="$WGH/$(basename "$PWD")" n; n=$(awk '/^name:/{print $2}' chart/Chart.yaml)
  rm -rf "$d"; mkdir -p "$d"; cp -R chart "$d/$n"; local f; for f in "$@"; do cp -R "$f" "$d/"; done; }
rel_status() { helm status "$1" -n $NS -o json 2>/dev/null | grep -o '"status":"[a-z-]*"' | head -1 | cut -d'"' -f4; }
rel_revs() { helm history "$1" -n $NS -o json 2>/dev/null | grep -o '"revision":[0-9]*' | wc -l | tr -d ' '; }
# empty work dir for "build it" levels
stage_dir() { local d="$WGH/$(basename "$PWD")"; rm -rf "$d"; mkdir -p "$d"; }
