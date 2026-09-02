Two causes: unsatisfiable provider version and a wrong attribute.
    random = { source = "hashicorp/random", version = "~> 3.6" }   # versions.tf
    content/value = random_pet.p.id                                # main.tf
