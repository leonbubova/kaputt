Revision 2 was upgraded without `-f values-prod.yaml`; helm reset to chart defaults + `replicas=3`.
    helm upgrade shop ./shop -n wg-helm -f values-prod.yaml --set replicas=3
