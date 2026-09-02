# write a deployment manifest
Ticket: "One pod is not a service. Please give us a real Deployment named `web` in `wg`: image `nginx:1.27-alpine`, 2 replicas, labelled `app=web` (on the deployment *and* on its pods)."
Write the manifest to a file, then apply it. Goal: `web` has 2 available replicas and the labels are in place.
