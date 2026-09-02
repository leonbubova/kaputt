# run the migration before the app comes up
Ticket: "Chart `web` needs a schema migration step: a Job `<release name>-migrate` (busybox, it just has to print `running schema migrations`) that Helm runs and waits for BEFORE it creates the Deployment. Keep the finished Job around so we can read its log. Then install release `web` in `wg-helm`."
Chart copy: `~/.k8s-wargame/helm/15-hook/web`. Goal: Job `web-migrate` completed, release `web` deployed, page reachable.
