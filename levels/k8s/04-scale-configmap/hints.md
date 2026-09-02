## 1
Replica count lives on the deployment: `kubectl scale deployment web --replicas=4`. Watch the rollout with `kubectl get pods -w`.
## 2
ConfigMaps hold plain key/value data. Create one from the command line: `kubectl create configmap notes --from-literal=KEY=VALUE`.
## 3
Verify like the checker: `kubectl get cm notes -o jsonpath='{.data.podcount}'` must print `4`, `kubectl get deploy web` must show `4/4`.
