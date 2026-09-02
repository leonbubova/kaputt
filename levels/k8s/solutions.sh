# machine-applied solutions, one function per level — used by run-all.sh only
s01(){ kubectl -n wg run hello --image=nginx:1.27-alpine; }
s02(){ kubectl -n wg create deployment web --image=nginx:1.27-alpine --replicas=2 --dry-run=client -o yaml | kubectl -n wg apply -f -; }
s03(){ kubectl -n wg expose deployment web --port=80 --target-port=80; }
s04(){ kubectl -n wg scale deployment web --replicas=4; kubectl -n wg create configmap notes --from-literal=podcount=4; }
s05(){ kubectl -n wg create configmap app-config --from-literal=GREETING=hello; kubectl -n wg apply -f - <<'Y'
apiVersion: v1
kind: Pod
metadata: {name: greeter}
spec:
  restartPolicy: Never
  containers:
  - {name: greeter, image: busybox:1.36, command: [sh, -c, 'echo $GREETING; sleep 3600'], envFrom: [{configMapRef: {name: app-config}}]}
Y
}
s06(){ kubectl -n wg create secret generic api-key --from-literal=token=abc123; kubectl -n wg apply -f - <<'Y'
apiVersion: v1
kind: Pod
metadata: {name: reader}
spec:
  containers:
  - {name: reader, image: busybox:1.36, command: [sleep, "3600"], volumeMounts: [{name: key, mountPath: /etc/secret}]}
  volumes: [{name: key, secret: {secretName: api-key}}]
Y
}
s07(){ kubectl create namespace team-a; kubectl -n team-a create deployment web --image=nginx:1.27-alpine; kubectl config set-context --current --namespace=team-a; }
s08(){ kubectl -n wg set env deploy/api DB_HOST=postgres.wg.svc DB_HOTS-; }
s09(){ kubectl -n wg set image deploy/web nginx=nginx:1.27-alpine; }
s10(){ kubectl -n wg set resources deploy/worker --requests=cpu=100m,memory=64Mi --limits=cpu=200m,memory=128Mi; }
s11(){ kubectl -n wg set resources deploy/cache --limits=memory=128Mi; }
s12(){ kubectl -n wg patch svc web -p '{"spec":{"selector":{"app":"web"}}}'; }
s13(){ kubectl -n wg patch svc web -p '{"spec":{"ports":[{"port":80,"targetPort":80}]}}'; }
s14(){ kubectl -n wg create secret generic db-credentials --from-literal=password=s3cret; }
s15(){ kubectl -n wg get cm web-config -o yaml | sed 's/lissen/listen/' | kubectl apply -f -; kubectl -n wg rollout restart deploy/web; }
s16(){ kubectl -n wg patch deploy web --type=json -p='[{"op":"replace","path":"/spec/template/spec/containers/0/livenessProbe/httpGet/path","value":"/"}]'; }
s17(){ kubectl -n wg patch deploy web --type=json -p='[{"op":"replace","path":"/spec/template/spec/containers/0/readinessProbe/tcpSocket/port","value":80}]'; }
s18(){ kubectl -n wg patch rolebinding reporter-reads-pods --type=json -p='[{"op":"replace","path":"/subjects/0/namespace","value":"wg"}]'; kubectl -n wg rollout restart deploy/reporter; }
s19(){ kubectl -n wg patch netpol allow-frontend-to-backend --type=json -p='[{"op":"replace","path":"/spec/ingress/0/from/0/podSelector/matchLabels/role","value":"frontend"}]'; }
s20(){ kubectl -n wg patch ingress web --type=json -p='[{"op":"replace","path":"/spec/rules/0/http/paths/0/backend/service/name","value":"web"}]'; }
s21(){ kubectl -n wg rollout undo deploy/web; kubectl -n wg rollout status deploy/web --timeout=90s; }
s22(){ kubectl label node k3d-wargame-agent-0 disktype=ssd --overwrite; }
s23(){ kubectl drain k3d-wargame-agent-1 --ignore-daemonsets --delete-emptydir-data --timeout=120s; }
s24(){ kubectl -n wg delete pod db --wait=true; kubectl -n wg delete pvc db-data --wait=true; kubectl -n wg apply -f - <<'Y'
apiVersion: v1
kind: PersistentVolumeClaim
metadata: {name: db-data}
spec: {accessModes: [ReadWriteOnce], storageClassName: local-path, resources: {requests: {storage: 1Gi}}}
---
apiVersion: v1
kind: Pod
metadata: {name: db}
spec:
  containers:
  - {name: db, image: busybox:1.36, command: ["sh","-c","echo hello > /data/marker && sleep infinity"], volumeMounts: [{name: data, mountPath: /data}]}
  volumes: [{name: data, persistentVolumeClaim: {claimName: db-data}}]
Y
}
s25(){ helm rollback shop 1 -n wg --wait --timeout 90s; }
