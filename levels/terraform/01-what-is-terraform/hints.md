## 1
Terraform needs its providers (the helper that creates files) before it can do anything in a folder. Fetching them is one command, run inside the play area.
## 2
Go into the folder first: `wg shell` (or `cd ~/.k8s-wargame/terraform/app`). Then the command is `terraform init`. `ls -a` afterwards shows `.terraform`.
## 3
    wg shell
    terraform init
