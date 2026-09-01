# node maintenance
"Kernel update on `k3d-wargame-agent-1` in 10 minutes. Move everything off it without downtime for `web`, and make sure nothing new lands there." Goal: agent-1 is SchedulingDisabled and has no `wg` pods; `web` still has 3 available replicas.
