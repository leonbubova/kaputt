    kubectl drain k3d-wargame-agent-1 --ignore-daemonsets --delete-emptydir-data
(drain cordons first; the PDB makes it evict one pod at a time.)
