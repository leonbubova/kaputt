source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_repo
wf worker.py <<'F'
import queue

MAX_RETRIES = 5
QUEUE = "jobs"

def run(job):
    for attempt in range(MAX_RETRIES + 1):
        try:
            return job()
        except Exception:
            continue
F
cm "Add job worker" "Jonas Reiter" jonas@example.com
wf worker.py <<'F'
import queue

MAX_RETRIES = 5
QUEUE = "jobs"
TIMEOUT = 30

def run(job):
    for attempt in range(MAX_RETRIES + 1):
        try:
            return job()
        except Exception:
            continue
F
cm "Add worker timeout" "Priya Nair" priya@example.com
wf worker.py <<'F'
"""Background job worker."""
import queue

MAX_RETRIES = 5
QUEUE = "jobs"
TIMEOUT = 30


def run(job):
    for attempt in range(MAX_RETRIES + 1):
        try:
            return job()
        except Exception:
            continue
F
cm "Add module docstring" "Tom Ahrens" tom@example.com
