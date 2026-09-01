## 1
Crashloop → logs. `kubectl logs <pod>`. nginx tells you file, line, and what it didn't understand.
## 2
The file comes from a ConfigMap mounted into /etc/nginx/conf.d. `kubectl get cm web-config -o yaml`.
## 3
`kubectl edit cm web-config`, fix the directive. Pods don't restart on ConfigMap change by themselves: `kubectl rollout restart deploy/web`.
