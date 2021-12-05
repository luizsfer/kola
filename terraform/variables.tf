# Common variable
variable path {
  description = "The path to the file to be uploaded"
  type        = string
  default     = "example/pets/cat.txt"
}

# List variable
variable prefix {
  type    = list
  default = ["Mr", "Mrs", "Sir"]
}

# Map variable
variable pet-type {
  type = map(string)
  default = {
    "cat" = "kitten",
    "dog" = "puppy",
  }
}

# Set variable
variable age {
  type = set(number)
  default = [1, 2, 3]
}

# Object variable
variable address {
  type = object({
    street = string
    house_number = number
  })
  default = {
    street = "Main",
    house_number = 42,
  }
}

# Tuples variable
variable sizes {
  type = tuple([number, number])
  default = [10, 20]
}
