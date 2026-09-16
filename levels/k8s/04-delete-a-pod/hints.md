## 1
`kubectl delete pod NAME` removes exactly one pod, the one you name. Nothing else is touched.
## 2
The name to delete is `bye`. Then `kubectl get pods` — `bye` shows Terminating for a moment and then disappears.
## 3
    kubectl delete pod bye
