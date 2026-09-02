## 1
Run it yourself: `helm lint ./web`. Lines marked `[ERROR]` block, `[INFO]`/`[WARNING]` don't.
## 2
The error is about `Chart.yaml`, not the templates. Every chart needs `apiVersion`, `name` and `version` (SemVer).
## 3
Add `version: 0.1.0` to `Chart.yaml`, lint again, then `helm install web ./web -n wg-helm`.
