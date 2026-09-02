## 1
RBAC is three objects: a ServiceAccount is the identity a pod runs as, a Role lists allowed verbs on resources inside one namespace, and a RoleBinding ties a Role to a subject. Nothing is allowed until a binding says so. Ask the API what an identity may do: `kubectl auth can-i list pods --as=system:serviceaccount:wg:reporter`.
## 2
kubectl creates all three without YAML: `kubectl create serviceaccount …`, `kubectl create role … --verb=… --resource=…`, `kubectl create rolebinding … --role=… --serviceaccount=<namespace>:<name>`. Subjects always carry a namespace — a ServiceAccount is `namespace:name`.
## 3
    kubectl create serviceaccount reporter
    kubectl create role pod-reader --verb=get,list --resource=pods
    kubectl create rolebinding reporter-reads-pods --role=pod-reader --serviceaccount=wg:reporter
Then `kubectl auth can-i list pods --as=system:serviceaccount:wg:reporter` → yes, `… delete pods …` → no.
