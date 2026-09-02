NS=${NS:-wg}
# machine-applied solutions, one function per level — used by run-all.sh only
s01(){ kubectl -n $NS run hello --image=nginx:1.27-alpine; }
s02(){ kubectl -n $NS create deployment web --image=nginx:1.27-alpine --replicas=2 --dry-run=client -o yaml | kubectl -n $NS apply -f -; }
s03(){ kubectl -n $NS expose deployment web --port=80 --target-port=80; }
s04(){ kubectl -n $NS scale deployment web --replicas=4; kubectl -n $NS create configmap notes --from-literal=podcount=4; }
s05(){ kubectl -n $NS create configmap app-config --from-literal=GREETING=hello; kubectl -n $NS apply -f - <<'Y'
apiVersion: v1
kind: Pod
metadata: {name: greeter}
spec:
  restartPolicy: Never
  containers:
  - {name: greeter, image: busybox:1.36, command: [sh, -c, 'echo $GREETING; sleep 3600'], envFrom: [{configMapRef: {name: app-config}}]}
Y
}
s06(){ kubectl -n $NS create secret generic api-key --from-literal=token=abc123; kubectl -n $NS apply -f - <<'Y'
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
s08(){ kubectl -n $NS set env deploy/api DB_HOST=postgres.wg.svc DB_HOTS-; }
s09(){ kubectl -n $NS set image deploy/web nginx=nginx:1.27-alpine; }
s10(){ kubectl -n $NS set resources deploy/worker --requests=cpu=100m,memory=64Mi --limits=cpu=200m,memory=128Mi; }
s11(){ kubectl -n $NS set resources deploy/cache --limits=memory=128Mi; }
s12(){ kubectl -n $NS patch svc web -p '{"spec":{"selector":{"app":"web"}}}'; }
s13(){ kubectl -n $NS patch svc web -p '{"spec":{"ports":[{"port":80,"targetPort":80}]}}'; }
s14(){ kubectl -n $NS create secret generic db-credentials --from-literal=password=s3cret; }
s15(){ kubectl -n $NS get cm web-config -o yaml | sed 's/lissen/listen/' | kubectl apply -f -; kubectl -n $NS rollout restart deploy/web; }
s16(){ kubectl -n $NS patch deploy web --type=json -p='[{"op":"replace","path":"/spec/template/spec/containers/0/livenessProbe/httpGet/path","value":"/"}]'; }
s17(){ kubectl -n $NS patch deploy web --type=json -p='[{"op":"replace","path":"/spec/template/spec/containers/0/readinessProbe/tcpSocket/port","value":80}]'; }
s18(){ kubectl -n $NS patch rolebinding reporter-reads-pods --type=json -p='[{"op":"replace","path":"/subjects/0/namespace","value":"wg"}]'; kubectl -n $NS rollout restart deploy/reporter; }
s19(){ kubectl -n $NS patch netpol allow-frontend-to-backend --type=json -p='[{"op":"replace","path":"/spec/ingress/0/from/0/podSelector/matchLabels/role","value":"frontend"}]'; }
s20(){ kubectl -n $NS patch ingress web --type=json -p='[{"op":"replace","path":"/spec/rules/0/http/paths/0/backend/service/name","value":"web"}]'; }
s21(){ kubectl -n $NS rollout undo deploy/web; kubectl -n $NS rollout status deploy/web --timeout=90s; }
s22(){ kubectl label node k3d-wargame-agent-0 disktype=ssd --overwrite; }
s23(){ kubectl drain k3d-wargame-agent-1 --ignore-daemonsets --delete-emptydir-data --timeout=120s; }
s24(){ kubectl -n $NS delete pod db --wait=true; kubectl -n $NS delete pvc db-data --wait=true; kubectl -n $NS apply -f - <<'Y'
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
s25(){ helm rollback shop 1 -n $NS --wait --timeout 90s; }
