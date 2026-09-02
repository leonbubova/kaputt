# paths — the address of a file
Lesson: every file and folder has an address, called a path. Folders in a path are separated by `/`.
    absolute path    starts with `/` — the full address from the top of the disk, e.g. /Users/you/Desktop. Works from anywhere.
    relative path    no leading `/` — starts from the folder you stand in. `kitchen/fridge.txt` = kitchen, inside here.
    shortcuts        ~  your home folder      .  this folder      ..  the folder above this one
So `../garden` means "go up one, then into garden". Pieces chain: `../../attic/box.txt`. The sandbox path you
have been typing, `~/.k8s-wargame/shell/sandbox`, is "home, then .k8s-wargame, then shell, then sandbox".
Try it:
    cd ~/.k8s-wargame/shell/sandbox/house/kitchen
    ls ..               the folders next to you: garden and kitchen
    ls ../garden        empty so far
Your task: stand in `~/.k8s-wargame/shell/sandbox/house/kitchen`. Without leaving it, create a file `plant.txt`
inside the neighbouring folder `garden` — one command, using `..`.
Check yourself:  wg check      stuck?  wg hint
