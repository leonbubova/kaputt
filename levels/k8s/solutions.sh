NS=${NS:-wg}
# machine-applied solutions, one function per level — used by run-all.sh only
# lessons 01–08 (absolute beginner) — the literal commands a player types
s01(){ mkdir -p "$HOME/.k8s-wargame/k8s"; kubectl get nodes > "$HOME/.k8s-wargame/k8s/nodes.txt"; }
s02(){ mkdir -p "$HOME/.k8s-wargame/k8s"; kubectl -n $NS describe pod demo > "$HOME/.k8s-wargame/k8s/demo.txt"; }
s03(){ mkdir -p "$HOME/.k8s-wargame/k8s"; cat > "$HOME/.k8s-wargame/k8s/first.yaml" <<'Y'
apiVersion: v1
kind: Pod
metadata:
  name: first
spec:
  containers:
  - name: web
    image: nginx:1.27-alpine
Y
kubectl -n $NS apply -f "$HOME/.k8s-wargame/k8s/first.yaml"; }
s04(){ kubectl -n $NS delete pod bye; }
s05(){ mkdir -p "$HOME/.k8s-wargame/k8s"; kubectl -n $NS wait --for=condition=Ready pod/talker --timeout=90s; i=0; until [ -s "$HOME/.k8s-wargame/k8s/word.txt" ] || [ $i -ge 15 ]; do kubectl -n $NS logs talker | sed -n 's/^the secret word is: //p' > "$HOME/.k8s-wargame/k8s/word.txt"; i=$((i+1)); sleep 2; done; }
s06(){ kubectl -n $NS scale deployment web --replicas=3; }
s07(){ kubectl -n $NS wait --for=condition=Ready pod/box --timeout=90s; kubectl -n $NS exec box -- sh -c 'echo hi > /tmp/hello.txt'; }
s08(){ kubectl -n $NS wait --for=condition=Ready pod/box --timeout=90s; kubectl -n $NS wait --for=condition=Available deploy/web --timeout=90s; kubectl -n $NS exec box -- sh -c 'wget -qO- http://web/ > /tmp/page.html'; }
s09(){ kubectl -n $NS run hello --image=nginx:1.27-alpine; }
s10(){ kubectl -n $NS create deployment web --image=nginx:1.27-alpine --replicas=2 --dry-run=client -o yaml | kubectl -n $NS apply -f -; }
s11(){ kubectl -n $NS expose deployment web --port=80 --target-port=80; }
s12(){ kubectl -n $NS scale deployment web --replicas=4; kubectl -n $NS create configmap notes --from-literal=podcount=4; }
s13(){ kubectl -n $NS create configmap app-config --from-literal=GREETING=hello; kubectl -n $NS apply -f - <<'Y'
apiVersion: v1
kind: Pod
metadata: {name: greeter}
spec:
  restartPolicy: Never
  containers:
  - {name: greeter, image: busybox:1.36, command: [sh, -c, 'echo $GREETING; sleep 3600'], envFrom: [{configMapRef: {name: app-config}}]}
Y
}
s14(){ kubectl -n $NS create secret generic api-key --from-literal=token=abc123; kubectl -n $NS apply -f - <<'Y'
apiVersion: v1
kind: Pod
metadata: {name: reader}
spec:
  containers:
  - {name: reader, image: busybox:1.36, command: [sleep, "3600"], volumeMounts: [{name: key, mountPath: /etc/secret}]}
  volumes: [{name: key, secret: {secretName: api-key}}]
Y
}
s15(){ kubectl create namespace team-a; kubectl -n team-a create deployment web --image=nginx:1.27-alpine; kubectl config set-context --current --namespace=team-a; }
s16(){ kubectl -n $NS set env deploy/api DB_HOST=postgres.wg.svc DB_HOTS-; }
s17(){ kubectl -n $NS set image deploy/web nginx=nginx:1.27-alpine; }
s18(){ kubectl -n $NS set resources deploy/web --requests=cpu=100m,memory=64Mi --limits=cpu=200m,memory=128Mi; }
s19(){ kubectl -n $NS set resources deploy/worker --requests=cpu=100m,memory=64Mi --limits=cpu=200m,memory=128Mi; }
s20(){ kubectl -n $NS set resources deploy/cache --limits=memory=128Mi; }
s21(){ kubectl -n $NS patch svc web -p '{"spec":{"selector":{"app":"web"}}}'; }
s22(){ kubectl -n $NS expose deployment web --port=8080 --target-port=80; }
s23(){ kubectl -n $NS patch svc web -p '{"spec":{"ports":[{"port":80,"targetPort":80}]}}'; }
s24(){ kubectl -n $NS create secret generic db-credentials --from-literal=password=s3cret; kubectl -n $NS apply -f - <<'Y'
apiVersion: v1
kind: Pod
metadata: {name: api}
spec:
  containers:
  - {name: api, image: busybox:1.36, command: [sleep, "3600"], env: [{name: DB_PASSWORD, valueFrom: {secretKeyRef: {name: db-credentials, key: password}}}]}
Y
}
s25(){ kubectl -n $NS create secret generic db-credentials --from-literal=password=s3cret; }
s26(){ kubectl -n $NS rollout restart deploy/web; kubectl -n $NS rollout status deploy/web --timeout=90s; }
s27(){ kubectl -n $NS get cm web-config -o yaml | sed 's/lissen/listen/' | kubectl apply -f -; kubectl -n $NS rollout restart deploy/web; }
s28(){ kubectl -n $NS patch deploy web -p '{"spec":{"template":{"spec":{"containers":[{"name":"nginx","livenessProbe":{"httpGet":{"path":"/","port":80},"periodSeconds":5}}]}}}}'; }
s29(){ kubectl -n $NS patch deploy web --type=json -p='[{"op":"replace","path":"/spec/template/spec/containers/0/livenessProbe/httpGet/path","value":"/"}]'; }
s30(){ kubectl -n $NS patch deploy web --type=json -p='[{"op":"replace","path":"/spec/template/spec/containers/0/readinessProbe/tcpSocket/port","value":80}]'; }
s31(){ kubectl -n $NS create serviceaccount reporter; kubectl -n $NS create role pod-reader --verb=get,list --resource=pods; kubectl -n $NS create rolebinding reporter-reads-pods --role=pod-reader --serviceaccount=wg:reporter; }
s32(){ kubectl -n $NS patch rolebinding reporter-reads-pods --type=json -p='[{"op":"replace","path":"/subjects/0/namespace","value":"wg"}]'; kubectl -n $NS rollout restart deploy/reporter; }
s33(){ kubectl -n $NS apply -f - <<'Y'
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata: {name: default-deny-ingress}
spec:
  podSelector: {}
  policyTypes: [Ingress]
Y
}
s34(){ kubectl -n $NS patch netpol allow-frontend-to-backend --type=json -p='[{"op":"replace","path":"/spec/ingress/0/from/0/podSelector/matchLabels/role","value":"frontend"}]'; }
s35(){ kubectl -n $NS create ingress web --rule="web.wg.local/*=web:80"; }
s36(){ kubectl -n $NS patch ingress web --type=json -p='[{"op":"replace","path":"/spec/rules/0/http/paths/0/backend/service/name","value":"web"}]'; }
s37(){ kubectl -n $NS rollout undo deploy/web; kubectl -n $NS rollout status deploy/web --timeout=90s; }
s38(){ kubectl label node k3d-wargame-agent-0 disktype=ssd --overwrite; }
s39(){ kubectl drain k3d-wargame-agent-1 --ignore-daemonsets --delete-emptydir-data --timeout=120s; }
s40(){ kubectl -n $NS delete pod db --wait=true; kubectl -n $NS delete pvc db-data --wait=true; kubectl -n $NS apply -f - <<'Y'
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
s41(){ helm rollback shop 1 -n $NS --wait --timeout 90s; }
