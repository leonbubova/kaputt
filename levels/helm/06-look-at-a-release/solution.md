`helm get values web -n wg-helm` shows the override (`environment: …`); write that word into answer.txt.
    cd ~/.k8s-wargame/helm/06-look-at-a-release && helm get values web -n wg-helm | awk '/^environment:/{print $2}' > answer.txt
