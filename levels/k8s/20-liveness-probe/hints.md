## 1
A liveness probe is the kubelet asking the container "are you alive?" on a schedule; a few failures in a row and it kills and restarts the container. The probe must hit something that answers 200 while the app is healthy — for nginx that's `/`. `kubectl explain deploy.spec.template.spec.containers.livenessProbe`.
## 2
The probe is part of the pod template, so adding it rolls the deployment. After the new pod is up, `kubectl describe pod <pod>` shows `Liveness: http-get http://:80/ ... period=5s` — and no "Liveness probe failed" events.
## 3
`kubectl edit deploy web` and add under the container:
    livenessProbe:
      httpGet:
        path: /
        port: 80
      periodSeconds: 5
(or the same as `kubectl patch deploy web -p '{"spec":{"template":{"spec":{"containers":[{"name":"nginx","livenessProbe":{"httpGet":{"path":"/","port":80},"periodSeconds":5}}]}}}}'`)
