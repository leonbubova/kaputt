# count makes N instances from one block, and count.index tells them apart
Lesson: when you need several copies of the same thing, you do not copy the block. `count = 3` on a resource turns one block into three instances, addressed as `local_file.node[0]`, `[1]`, `[2]`. Terraform tracks each one separately in state.
Inside the block, `count.index` is the number of the instance being built, starting at 0. Use it wherever the copies must differ — in a filename, in content, in a name — otherwise all three would try to be the same file.
Count is the simplest multi-instance tool. Its weakness: the instances are identified by position, so removing the first one shifts every other index. (The next levels build on this.)
    count = 3                                       three instances of this block
    count.index                                     0, 1, 2 — which instance this is
    filename = "${path.module}/out/n-${count.index}.txt"    interpolate it to make each copy unique
    terraform state list                            shows the instances as name[0], name[1], ...
Try it first: `terraform plan` on a counted resource — the plan lists each instance separately.
Your task: we need three files `out/node-0.txt`, `out/node-1.txt`, `out/node-2.txt`, each containing `node <index>`. Use `count` — don't copy-paste three blocks.
Goal: after apply, the three files exist with the right content, from a single counted resource.
Check yourself:  wg check      stuck?  wg hint
