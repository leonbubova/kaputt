t(){ printf '\033[38;5;183mkaputt\033[0m ~ $ '; for ((i=0;i<${#1};i++)); do printf '%s' "${1:$i:1}"; sleep 0.035; done; sleep 0.4; printf '\n'; }
run(){ t "$1"; eval "$1"; printf '\n'; sleep 1.2; }
run 'wg brief'
run 'kubectl get pods'
run 'kubectl logs deploy/api'
run 'kubectl set env deploy/api DB_HOST=postgres.wg.svc DB_HOTS-'
run 'kubectl rollout status deploy/api'
run 'wg check'
sleep 2.5
