# nightly report job dies halfway
"`wg-report` exits with code 1 every night: `FATAL: report generation crashed`. On a laptop it runs fine. Ops set resource limits on that host last week."
Goal: `wg-report` runs to completion — logs say `report done`, the container stays up, and `/dev/shm/report.bin` inside is the full 48 MB. Keep a memory limit (≤ 256 MB).
