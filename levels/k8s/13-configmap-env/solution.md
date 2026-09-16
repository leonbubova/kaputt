    kubectl create configmap app-config --from-literal=GREETING=hello
    kubectl apply -f - <<'Y'
    apiVersion: v1
    kind: Pod
    metadata: {name: greeter}
    spec:
      restartPolicy: Never
      containers:
      - {name: greeter, image: busybox:1.36, command: [sh, -c, 'echo $GREETING; sleep 3600'], envFrom: [{configMapRef: {name: app-config}}]}
    Y
