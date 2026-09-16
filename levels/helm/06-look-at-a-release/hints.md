## 1
The chart's values.yaml says `dev`, but the release was installed with a different value on the command line. Only Helm remembers such overrides — ask Helm, not the file.
## 2
`helm get values web -n wg-helm` prints the overrides as YAML: a line `environment: SOMETHING`. That word is the answer.
## 3
    cd ~/.k8s-wargame/helm/06-look-at-a-release
    helm get values web -n wg-helm
    echo THE-WORD-YOU-SAW > answer.txt
