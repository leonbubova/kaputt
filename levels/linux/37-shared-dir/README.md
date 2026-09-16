# team share: files bob creates, alice cannot edit
"`/srv/share` belongs to group `dev`, both alice and bob are in `dev`, umask is 002 for everyone. Still, whenever bob drops a file there alice gets `Permission denied` writing to it."
Goal: a file newly created by bob in `/srv/share` is writable by alice (group `dev`). Don't chmod the files one by one.
