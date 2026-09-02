# relative paths in Node resolve against a base, and a failing lifecycle hook aborts boot
Lesson: Node never opens "seed/users.json". It opens an absolute path computed from a base plus your relative piece. Two bases are common and they differ: `process.cwd()` is where the process was started (the project root under `npm run start:dev`); `__dirname` is the folder of the source file containing the line. Move a file into a subfolder and `__dirname` moves with it; `process.cwd()` does not.
ENOENT carries the absolute path that was tried. Compare it with where the file really is and the wrong base is obvious.
Second idea: `onModuleInit` is a Nest lifecycle hook, run during startup before the app listens. If it throws or rejects, boot aborts — a data-loading bug shows up as "won't start", not as a broken endpoint.
    join(process.cwd(), 'seed', 'users.json')     path from the project root
    join(__dirname, 'seed', 'users.json')         path from the source file's folder
    node -e "console.log(process.cwd())"          what cwd is in the app dir
    ls seed/                                      where the file actually lives
Try it first: boot and copy the full path out of the ENOENT line; run `ls` on its parent directory.
Your task: since the seed loader was 'made path-safe' the app crashes on start: `ENOENT: no such file or directory ... users.json`. The file is right there in `seed/`.
Goal: the app boots and `GET /users` returns the 3 users from `seed/users.json` (keep loading them from that file).
Check yourself:  wg check      stuck?  wg hint
