source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/bash/bashlib.sh"
wf app.log <<'F'
INFO started
ERROR disk full
INFO retry
ERROR timeout
ERROR disk full
INFO done
F
