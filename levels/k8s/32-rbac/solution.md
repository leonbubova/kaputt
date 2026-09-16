RoleBinding subject namespace is `default`, the SA lives in `wg`.
    kubectl edit rolebinding reporter-reads-pods   # subjects[0].namespace: wg
