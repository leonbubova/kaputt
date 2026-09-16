## 1
The resource block already describes the file. Nothing exists until you tell terraform to make reality match the description — that is apply.
## 2
Inside ~/.k8s-wargame/terraform/app: init first (fresh folder), then apply with `-auto-approve` so it does not wait for a yes.
## 3
    wg shell
    terraform init
    terraform apply -auto-approve
    cat out/note.txt
