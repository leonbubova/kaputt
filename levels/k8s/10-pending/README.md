# Pending means no node accepted the pod — requests must fit a node
Lesson: before a pod runs anywhere, the scheduler has to pick a node for it. It looks at what the pod asks for and at what each node can still give. If no node fits, the pod stays `Pending` — not failed, not running, just waiting for a node that may never come. No container has started, so there are no logs and no restarts.
`resources.requests` is the ask: the CPU and memory the scheduler must reserve on a node. `limits` is the ceiling the container may use. A request is the scheduler's only input; a node with less allocatable than the request is simply not a candidate.
The scheduler writes its reasoning into the pod's Events, in plain words: how many nodes it considered and why each was rejected. Compare that with the node's Allocatable and the mismatch is visible.
    kubectl get pods                             STATUS Pending, no restarts
    kubectl describe pod NAME                    Events: the scheduler's verdict
    kubectl get nodes                            the nodes available
    kubectl describe node NAME                   Capacity, Allocatable, Allocated resources
    kubectl set resources deploy/NAME --requests=cpu=..,memory=.. --limits=cpu=..,memory=..   change what the pod asks for
Try it first: `kubectl describe node $(kubectl get nodes -o name | head -1 | cut -d/ -f2) | grep -A6 Allocatable` — what one node can hand out.
Your task: "The `worker` pod never starts. No errors, no logs, just Pending." Goal: worker running.
Check yourself:  wg check      stuck?  wg hint
