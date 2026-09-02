# read the DI error: it names the module, the class and which argument is unsatisfied
Lesson: Nest builds the entire dependency graph before it listens. Every constructor parameter of every controller and provider is looked up: provided in the same module, or exported by an import? One miss and the process exits — nothing half-boots.
The error is precise if you read it slowly. "Nest can't resolve dependencies of the X (?)" — X is the class whose constructor failed, the `?` sits at the argument it could not fill. It continues: "the argument Y at index [0] is available in the Z context" — the missing type and the module that was searched. The tail lists the possible fixes; only one applies.
Subtle case: `exports` says "others may have this", `providers` says "I build this". A class can appear in one list without the other — you can only export what you provide.
    npm run start:dev                the first ERROR block at boot is the whole diagnosis
    providers: [X]                   the module builds X
    exports: [X]                     the module shares X; requires providers too
    cat src/users/users.module.ts    compare its lists with the constructors
Try it first: boot; read the error to its last line before opening any file.
Your task: someone split `users` into its own module yesterday. Since then `npm run start:dev` dies at boot with a red Nest error.
Goal: the app boots, `GET /users` lists the seed users and `GET /users/1` works.
Check yourself:  wg check      stuck?  wg hint
