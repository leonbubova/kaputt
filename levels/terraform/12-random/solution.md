Generate with random_pet and reference its id.
    resource "random_pet" "n" { length = 2 }
    content = random_pet.n.id
