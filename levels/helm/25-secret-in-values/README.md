# audit finding: database password in helm
"Security ran `helm get values shop -n wg-helm --all` and found the DB password in plaintext. Also `helm get manifest`. Finding must be closed today; the app must keep working with the SAME password (`s3cret-hunter2`)."
Chart copy: `~/.k8s-wargame/helm/25-secret-in-values/shop`. Goal: neither `helm get values --all` nor `helm get manifest` contain the password (plain or base64), pod still gets `DB_PASSWORD` from a Secret and is available.
