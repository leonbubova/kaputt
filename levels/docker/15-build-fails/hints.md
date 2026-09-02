## 1
Run the build yourself and read the failing step: `docker build -t wg-tool:1.0 .`
## 2
`COPY` fails when the source file is not in the build context. `ls` the directory and compare byte for byte with the Dockerfile line.
## 3
Fix the filename in the `COPY` line of the Dockerfile, rebuild, then `docker run --rm wg-tool:1.0`.
