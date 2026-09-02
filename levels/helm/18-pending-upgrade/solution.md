Revision 2 is stuck in `pending-upgrade` (helm was killed). Rollback clears it.
    helm rollback shop 1 -n wg-helm && helm upgrade shop ./shop -n wg-helm --wait
