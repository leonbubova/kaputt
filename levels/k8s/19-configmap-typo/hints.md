## 1
nginx parses its whole config at start and exits on the first directive it can't read — so a typo in the config becomes a crashloop, and the error names file and line. `kubectl logs <pod>` shows it.
## 2
The file comes from a ConfigMap mounted into /etc/nginx/conf.d. `kubectl get cm web-config -o yaml`.
## 3
`kubectl edit cm web-config`, fix the directive. Pods don't restart on ConfigMap change by themselves: `kubectl rollout restart deploy/web`.
