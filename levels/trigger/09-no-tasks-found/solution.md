`trigger.config.ts` points `dirs` at `./src/jobs`, which does not exist; the tasks live in `./src/trigger`.
    sed -i 's#./src/jobs#./src/trigger#' trigger.config.ts
