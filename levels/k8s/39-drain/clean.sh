NS=${NS:-wg}
kubectl uncordon k3d-wargame-agent-1 >/dev/null 2>&1 || true
