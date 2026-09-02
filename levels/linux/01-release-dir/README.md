# prepare the release directory
Ticket: "Release 1.4.2 ships tonight. Create `/srv/app/releases/1.4.2/` with a file `VERSION` containing exactly `1.4.2`, and an empty subdirectory `conf/` next to it." (`wg shell` puts you on the box as root.)
Goal: `/srv/app/releases/1.4.2/VERSION` holds `1.4.2`; `/srv/app/releases/1.4.2/conf/` exists and is a directory.
