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
import queue

MAX_RETRIES = 0
QUEUE = "jobs"
TIMEOUT = 30

def run(job):
    for attempt in range(MAX_RETRIES + 1):
        try:
            return job()
        except Exception:
            continue
F
cm "Tune worker for migration window" "Mara Vogt" mara@example.com
wf worker.py <<'F'
"""Background job worker."""
import queue

QUEUE = "jobs"
TIMEOUT = 30
MAX_RETRIES = 0


def run(job):
    for attempt in range(MAX_RETRIES + 1):
        try:
            return job()
        except Exception:
            continue
F
cm "Reorder constants, add module docstring" "Tom Ahrens" tom@example.com
wf worker.py <<'F'
"""Background job worker."""
import logging
import queue

QUEUE = "jobs"
TIMEOUT = 30
MAX_RETRIES = 0

log = logging.getLogger(__name__)


def run(job):
    for attempt in range(MAX_RETRIES + 1):
        try:
            return job()
        except Exception:
            log.exception("job failed")
            continue
F
cm "Log failed jobs" "Priya Nair" priya@example.com
