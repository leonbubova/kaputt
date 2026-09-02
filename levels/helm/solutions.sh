NS=${NS:-wg-helm}
# machine-applied solutions, one function per level — used by run-all.sh only
WGH=${WG_STATE:-$HOME/.k8s-wargame}/helm; hn(){ helm -n $NS "$@"; }; sedi(){ sed -i.bak "$1" "$2" && rm -f "$2.bak"; }
s01(){ cd "$WGH/01-create-install" && helm create hello >/dev/null && hn install wg-hello ./hello --set image.tag=1.27-alpine --wait --timeout 90s; }
s02(){ cd "$WGH/02-set-values" && hn upgrade web ./web --set replicas=2 --wait --timeout 90s; }
s03(){ cd "$WGH/03-values-file" && printf "environment: prod\ndomain: shop.example.com\nreplicas: 2\n" > values-prod.yaml && hn install shop ./shop -f values-prod.yaml --wait --timeout 90s; }
s04(){ cd "$WGH/04-configmap-template" && echo "greeting: hello from helm" >> web/values.yaml && printf "apiVersion: v1\nkind: ConfigMap\nmetadata:\n  name: {{ .Release.Name }}-config\ndata:\n  GREETING: {{ .Values.greeting | quote }}\n" > web/templates/config.yaml && hn upgrade web ./web --wait --timeout 90s; }
s05(){ cd "$WGH/05-upgrade-uninstall" && sedi "s/^version: 0.1.0/version: 0.2.0/" web/Chart.yaml && sedi "s/^environment: dev/environment: staging/" web/values.yaml && hn upgrade web ./web --wait --timeout 90s && hn uninstall wg-legacy; }
s06(){ cd "$WGH/06-if-block" && echo 'debug: false' >> web/values.yaml && printf 'apiVersion: v1\nkind: ConfigMap\nmetadata:\n  name: {{ .Release.Name }}-html\n  labels:\n    app: {{ .Release.Name }}\ndata:\n  index.html: |\n    <h1>{{ .Release.Name }}</h1>\n    <p>env={{ .Values.environment }} domain={{ .Values.domain | default "localhost" }}</p>\n    {{- if .Values.debug }}\n    <p>debug=on</p>\n    {{- end }}\n' > web/templates/configmap.yaml && hn upgrade web ./web --set debug=true --wait --timeout 90s; }
s07(){ cd "$WGH/07-template-syntax" && printf '          {{- end }}\n' >> web/templates/deployment.yaml && hn install web ./web --wait --timeout 90s; }
s08(){ cd "$WGH/08-values-typo" && sedi 's/tagg:/tag:/' web/values.yaml && hn upgrade web ./web --wait --timeout 90s; }
s09(){ cd "$WGH/09-lint" && echo 'version: 0.1.0' >> web/Chart.yaml && helm lint web && hn install web ./web --wait --timeout 90s; }
s10(){ cd "$WGH/10-toyaml" && printf 'files:\n  index.html: "<h1>web</h1><p>hello from the configmap</p>"\n  robots.txt: "User-agent: *\\nDisallow: /admin\\n"\n' >> web/values.yaml && printf 'apiVersion: v1\nkind: ConfigMap\nmetadata:\n  name: {{ .Release.Name }}-html\n  labels:\n    app: {{ .Release.Name }}\ndata:\n  {{- toYaml .Values.files | nindent 2 }}\n' > web/templates/configmap.yaml && hn upgrade web ./web --wait --timeout 90s; }
s11(){ cd "$WGH/11-indent" && sedi 's/| indent 2/| nindent 2/' web/templates/configmap.yaml && hn install web ./web --wait --timeout 90s; }
s12(){ cd "$WGH/12-required-value" && sedi 's/{{ .Values.domain }}/{{ required "domain is required" .Values.domain }}/' shop/templates/configmap.yaml && hn install shop ./shop -f values-prod.yaml --wait --timeout 90s; }
s13(){ cd "$WGH/13-required" && hn install shop ./shop -f values-prod.yaml --wait --timeout 90s; }
s14(){ cd "$WGH/14-quoted-port" && sedi 's/{{ .Values.port | quote }}/{{ .Values.port }}/' web/templates/deployment.yaml && hn install web ./web --wait --timeout 90s; }
s15(){ cd "$WGH/15-hook" && printf 'apiVersion: batch/v1\nkind: Job\nmetadata:\n  name: {{ .Release.Name }}-migrate\n  annotations:\n    "helm.sh/hook": pre-install\nspec:\n  template:\n    spec:\n      restartPolicy: Never\n      containers:\n        - name: migrate\n          image: busybox:1.36\n          command: ["sh", "-c", "echo running schema migrations"]\n' > web/templates/migrate-job.yaml && hn install web ./web --wait --timeout 90s; }
s16(){ cd "$WGH/16-hook-fail" && sedi 's#/bin/bash#/bin/sh#' web/templates/migrate-job.yaml && hn uninstall web; hn install web ./web --wait --timeout 90s; }
s17(){ cd "$WGH/17-failed-upgrade" && hn rollback shop 1 --wait --timeout 90s && sedi 's/1.27-alpine-perl-slim/1.27-alpine/' values-launch.yaml && hn upgrade shop ./shop -f values-launch.yaml --rollback-on-failure --wait --timeout 120s; }
s18(){ cd "$WGH/18-pending-upgrade" && hn rollback shop 1 --wait --timeout 90s && hn upgrade shop ./shop --wait --timeout 90s; }
s19(){ cd "$WGH/19-subchart-condition" && printf '    condition: cache.enabled\n' >> shop/Chart.yaml && printf 'cache:\n  enabled: false\n' >> shop/values.yaml && hn install shop ./shop -f values-prod.yaml --wait --timeout 120s; }
s20(){ cd "$WGH/20-subchart" && sedi 's/^cahce:/cache:/' values-prod.yaml && hn upgrade shop ./shop -f values-prod.yaml --wait --timeout 120s; }
s21(){ cd "$WGH/21-reuse-values" && hn upgrade shop ./shop -f values-prod.yaml --set replicas=3 --wait --timeout 90s; }
s22(){ cd "$WGH/22-wrong-namespace" && helm uninstall shop -n wg-helm-staging && hn install shop ./shop --wait --timeout 90s; }
s23(){ cd "$WGH/23-name-in-use" && hn uninstall shop && hn install shop ./shop --wait --timeout 90s; }
s24(){ cd "$WGH/24-immutable" && sedi '/^tier:/d' values-prod.yaml && hn upgrade shop ./shop -f values-prod.yaml --wait --timeout 90s; }
s25(){ cd "$WGH/25-secret-in-values" && kubectl -n $NS create secret generic shop-db-ext --from-literal=password=s3cret-hunter2 && sedi '/^  password:/d' shop/values.yaml && hn upgrade shop ./shop --set db.existingSecret=shop-db-ext --wait --timeout 90s; }
