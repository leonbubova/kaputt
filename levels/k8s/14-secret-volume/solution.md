    kubectl create secret generic api-key --from-literal=token=abc123
    kubectl apply -f - <<'Y'
    apiVersion: v1
    kind: Pod
    metadata: {name: reader}
    spec:
      containers:
      - {name: reader, image: busybox:1.36, command: [sleep, "3600"], volumeMounts: [{name: key, mountPath: /etc/secret}]}
      volumes: [{name: key, secret: {secretName: api-key}}]
    Y
