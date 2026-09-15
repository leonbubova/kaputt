    kubectl create serviceaccount reporter
    kubectl create role pod-reader --verb=get,list --resource=pods
    kubectl create rolebinding reporter-reads-pods --role=pod-reader --serviceaccount=wg:reporter
