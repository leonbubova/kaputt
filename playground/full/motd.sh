[ -f ~/.bashrc ] && . ~/.bashrc || true
mkdir -p ~/.k8s-wargame; [ -f ~/.k8s-wargame/track ] || echo shell > ~/.k8s-wargame/track
export KUBECONFIG=$HOME/.kube/config WG_K3S_SNAPSHOTTER=native
__wg_ps1(){ local st; st=$(command wg status --short 2>/dev/null); PS1="\[\e[38;5;183m\]kaputt\[\e[0m\] \[\e[2m\]${st}\[\e[0m\] \w \$ "; }
PROMPT_COMMAND=__wg_ps1
wg(){ command wg "$@"; local rc=$?; case "${1:-}" in level|next|random|speedrun|reset|track) local d; d=$(command wg pwd 2>/dev/null) && [ -n "$d" ] && [ -d "$d" ] && cd "$d";; esac; return $rc; }
printf '\n\033[38;5;183m  kaputt\033[0m — break it. fix it. understand it.\n'
printf '  your own sandbox: a private docker daemon, a private k8s cluster. no internet. gone when you close the tab.\n\n'
printf '  \033[2m$\033[0m wg list        tracks & levels     \033[2m$\033[0m wg help     the commands you need\n'
printf '  \033[2m$\033[0m wg track k8s   e.g. kubernetes     \033[2m$\033[0m wg start    bring its environment up\n'
printf '  \033[2m$\033[0m wg level 1     break something     \033[2m$\033[0m wg check    am i done?   \033[2m(stuck? wg hint)\033[0m\n\n'
