# a Deployment keeps N pods alive, and labels are what ties them together
Lesson: a single Pod dies and stays dead. A Deployment is a controller: you declare a pod template plus a replica count, and it keeps that many copies running, replacing any that disappear. You never manage its pods by hand — you change the Deployment and it catches up.
Labels are the glue. `spec.selector.matchLabels` says which pods belong to the Deployment, and `spec.template.metadata.labels` stamps those labels onto every pod it creates. The two must agree or the apply is rejected.
Nobody types manifests from memory. `--dry-run=client -o yaml` prints a correct manifest without creating anything; save it, read it, apply it. The file is now the source of truth.
    kubectl create deployment NAME --image=IMG --replicas=2 --dry-run=client -o yaml > f.yaml   draft the manifest
    kubectl apply -f f.yaml                      create or update from the file
    kubectl get deploy NAME                      READY column: available/desired
    kubectl get pods --show-labels               the labels on each pod
    kubectl explain deployment.spec.template     what a field means
Try it first: run the dry-run line for any name and count where `app:` appears in the output.
Your task: ticket: "One pod is not a service. Please give us a real Deployment named `web` in `wg`: image `nginx:1.27-alpine`, 2 replicas, labelled `app=web` (on the deployment *and* on its pods)." Write the manifest to a file, then apply it. Goal: `web` has 2 available replicas and the labels are in place.
Check yourself:  wg check      stuck?  wg hint
