# install fails in "pre-install"
"`helm install web ./web -n wg-helm` sits there for a while, then: `failed pre-install: ... BackoffLimitExceeded`. The migration job is mandatory before the app comes up."
Chart copy: `~/.k8s-wargame/helm/12-hook-fail/web`. Goal: migration job `web-migrate` completed successfully, release `web` deployed, page reachable. Keep the hook.
