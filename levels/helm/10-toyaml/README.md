# static files belong in values, not in the template
Ticket: "The content team keeps editing `templates/configmap.yaml` of release `web` to change `index.html`, and they need a second file `robots.txt` (`User-agent: *` / `Disallow: /admin`). Move the files into a chart value `files` (filename → content) and let the ConfigMap render whatever that map contains — adding a third file later must not need a template change."
Chart copy: `~/.k8s-wargame/helm/10-toyaml/web`. Goal: ConfigMap `web-html` holds `index.html` and `robots.txt` from `values.yaml`, page still shows `hello from the configmap`.
