# .gitignore says build/ but build/out.log keeps showing up in diffs
"We added `build/` to `.gitignore` last sprint, yet every run of the build makes `build/out.log` appear as modified." Repo: `~/.k8s-wargame/git/repo`.
Goal: `build/out.log` is no longer tracked (committed), still on disk, ignored — `git status` is clean after a build. Keep `.gitignore` as is.
