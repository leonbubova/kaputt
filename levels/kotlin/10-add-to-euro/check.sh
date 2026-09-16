source "$WG_ROOT/levels/kotlin/lib.sh"
grep -rq "fun Int.toEuro" "$APP/src" || fail "toEuro must be an extension function on Int (fun Int.toEuro)"
kt_check
