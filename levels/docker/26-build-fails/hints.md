## 1
A Dockerfile runs top to bottom, one step per instruction, and `COPY` can only take files that exist in the build context (the directory you pass to `docker build`). A build that breaks 'without code changes' usually means a filename in the Dockerfile and a file on disk no longer match. Run the build yourself and read the failing step: `docker build -t wg-tool:1.0 .`
## 2
`COPY` fails when the source file is not in the build context. `ls` the directory and compare byte for byte with the Dockerfile line.
## 3
Fix the filename in the `COPY` line of the Dockerfile, rebuild, then `docker run --rm wg-tool:1.0`.
