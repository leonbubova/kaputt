# shown on every fresh session
[ -f ~/.bashrc ] && . ~/.bashrc || true
# default track for the demo (state lives in the tmpfs home, so seed it per session)
mkdir -p ~/.k8s-wargame; [ -f ~/.k8s-wargame/track ] || echo shell > ~/.k8s-wargame/track
export PS1='\[\e[38;5;183m\]kaputt\[\e[0m\] \w \$ '
printf '\n\033[38;5;183m  kaputt\033[0m — break it. fix it. understand it.\n'
printf '  this is a throwaway sandbox: nothing here survives the tab.\n\n'
printf '  \033[2m$\033[0m wg primer      the ~10 commands you need\n'
printf '  \033[2m$\033[0m wg level 1     load the first broken level\n'
printf '  \033[2m$\033[0m wg check       am i done?      \033[2m(stuck? wg hint)\033[0m\n'
printf '  \033[2m$\033[0m wg track git   also here: git · bash   \033[2m(you start in \033[0mshell\033[2m — the terminal from zero)\033[0m\n\n'
