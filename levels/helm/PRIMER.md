# helm — the commands you'll actually use
Never used helm? Skip this list — levels 1–7 teach it step by step. It comes back any time with `wg help`.
  helm create <name>                         scaffold a chart
  helm install <release> <chart> -n ns       deploy it
  helm upgrade <release> <chart> -f values.yaml / --set k=v    change it
  helm template <chart>                      render the YAML locally — see what you're about to apply
  helm lint <chart>                          catch template mistakes
  helm list -A                               every release, every namespace
  helm history <release>                     revisions
  helm rollback <release> <rev>              go back
  helm get values <release>                  what values are live
  helm uninstall <release>

Mental model: a chart = templates + values. `helm template` before `install` saves you from most surprises; `history` + `rollback` fix the rest.
