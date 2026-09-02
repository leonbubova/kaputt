## 1
The `random` provider offers `random_pet`. Its generated value is the `.id` attribute.
## 2
Write `random_pet.n.id` into the file's content and into an output.
## 3
    resource "random_pet" "n" { length = 2 }
    resource "local_file" "name" { filename = "${path.module}/out/name.txt", content = random_pet.n.id }
    output "pet" { value = random_pet.n.id }
