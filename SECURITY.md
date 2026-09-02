# Security model

This is a local training tool that deliberately breaks things. Be clear-eyed about what that means
before you run it, publish it, or let others contribute to it.

## Threat model in one line

**Running the wargame runs code on your machine as you.** Levels are shell scripts and small apps
that execute when you load or check a level. Only run levels you trust, the same way you would only
`curl | sh` a script you have read.

## Real risks, and what mitigates them

### 1. The CLI acts on whatever tools you have configured — highest risk
`wg` drives your real `kubectl`, `docker`, and `helm`. The dangerous case is the **k8s/helm tracks
resetting a namespace**: `track_wipe` runs `kubectl delete ns wg`. If your current kubectl context
pointed at a real cluster that happened to have a `wg` namespace, that delete would hit production.
- **Mitigation (in place):** every destructive kubectl operation first calls `assert_wargame_ctx`,
  which refuses to run unless the current context is exactly `k3d-wargame`.
- **Still your job:** don't repoint the `k3d-wargame` context at something real.

### 2. The `pentest` track ships intentionally vulnerable code
By design it contains SQL injection, command injection, XSS, path traversal, and prototype pollution.
The command-injection level is real remote code execution **if the app is reachable from the network**.
- **Mitigation:** the app binds to `127.0.0.1` only and is never exposed beyond your machine. Keep it
  that way. Never run these levels on a shared or internet-facing host.

### 3. Local service tracks publish ports
`postgres`, `nginx`, and similar start containers with published ports. A password is known (it's in
the level), so an exposed port is an open door.
- **Mitigation (in place):** ports bind to `127.0.0.1` only, not `0.0.0.0`. `redis` isn't published at
  all (reached via `docker exec`). If you add a track, bind to loopback.

### 4. Elevated container capabilities
The `networking` track runs a container with `--cap-add NET_ADMIN --cap-add NET_RAW`, and the
`systemd` track needs a remote host with passwordless sudo. These are necessary for the exercises but
are more privilege than a normal container. Run them on disposable hosts.

### 5. Supply chain
- `install.sh` fetches Docker, k3d, and Helm from their official installers (`curl … | sh`). Read it.
- The Node tracks (`nextjs`, `nestjs`, `trigger`) run `npm install` from a template `package.json` and
  execute those dependencies. Pin and review them if you don't trust the source.
- **Community-contributed levels are executable code.** Review every `break.sh`, `check.sh`, and
  `track.sh` in a pull request before merging — a malicious level runs with your privileges.

## The browser playground: one sandbox per player

Every visitor gets **their own Docker daemon and their own Kubernetes cluster**, so no player can see or
touch another's containers, namespaces, or ports — and every level's text stays literally true. The
obvious way to do that (Docker-in-Docker) normally needs `--privileged`, which we refuse. Instead:

- **Sysbox runtime** (`--runtime=sysbox-runc`): the sandbox runs the inner `dockerd` and `k3d` in an
  *unprivileged* container. Root inside the sandbox is an unprivileged uid on the host (user namespaces),
  and sensitive syscalls are intercepted. No `--privileged`, no host Docker socket inside.
- **No internet.** The sandbox is attached to an `--internal` Docker network: no route out. Every image
  and dependency the tracks need is pre-baked into the sandbox image at build time (`playground/full/`).
  A compromised or abusive session cannot mine, scan, or exfiltrate.
- **Hard caps** per sandbox: memory (default 4 GB), CPU (2), pids (4096), a 45-minute lifetime, and a
  ceiling on concurrent sessions. The sandbox is destroyed on disconnect; nothing persists.
- **Edge:** ttyd is never exposed directly — a reverse proxy with TLS and rate limiting sits in front.
- **Fallback isolation:** the host has KVM; if Sysbox ever proves insufficient, the same image can run
  under a microVM runtime (Kata/Firecracker) for VM-grade boundaries.

What this does **not** protect against: a kernel exploit from inside a user namespace (the shared risk of
all container sandboxes — keep the host kernel and Sysbox current), and resource contention between
sessions beyond the caps (watch the host; the caps are ceilings, not guarantees).

## Not a real issue

- **Fake secrets.** Levels contain strings like `password=s3cret`, `token=abc123`, `hunter2`. These
  are throwaway teaching values, not real credentials. Automated secret scanners will flag them; they
  are safe. Do not reuse them anywhere real.

## If you find a vulnerability

Open a private report rather than a public issue for anything that lets a level escape its intended
scope (host compromise from a level, a check that can be passed without fixing the flaw in a way that
teaches an insecure pattern).
