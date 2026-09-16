# names instead of numbers — /etc/hosts
Lesson: people type names like `api.internal`, machines need addresses. Turning a name into an address is
called resolving. The box looks in two places: first its own list in the file `/etc/hosts` (one line per name:
`ADDRESS  NAME`), then it asks a DNS server on the network. A name found in neither resolves to nothing,
and every connection to it fails before it even starts.
    cat /etc/hosts                    the local list
    getent hosts NAME                 what does NAME resolve to? (checks both places; no output = unknown)
    dig +short NAME                   asks only DNS — useful to tell the two places apart
Try it — inside the box:
    getent hosts localhost
    cat /etc/hosts
Your task: someone added the name `lab.internal` to this box's `/etc/hosts`. Find the address it points to and
write only that address into the file `/root/lab-ip.txt`.
Work inside the box (`wg shell`).
Check yourself:  wg check      stuck?  wg hint
