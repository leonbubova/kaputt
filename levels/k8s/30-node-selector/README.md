# gpu job won't schedule
"The `trainer` pod must run on our fast-disk node. It's Pending and the scheduler complains about node affinity/selector." Goal: trainer Running. Don't remove the nodeSelector — the constraint is intentional; make a node match it.
