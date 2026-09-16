source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
need_app
[ -d "$APP/.terraform/providers" ] || fail "no .terraform folder in ~/.k8s-wargame/terraform/app yet — run: terraform init"
[ -f "$APP/.terraform.lock.hcl" ] || fail ".terraform.lock.hcl missing — terraform init did not finish; read its last lines"
ok "terraform init done — providers fetched, the folder is ready"
