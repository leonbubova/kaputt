NS=${NS:-wg}
helm uninstall shop -n $NS --no-hooks >/dev/null 2>&1 || true
