    kubectl patch deploy web -p '{"spec":{"template":{"spec":{"containers":[{"name":"nginx","livenessProbe":{"httpGet":{"path":"/","port":80},"periodSeconds":5}}]}}}}'
