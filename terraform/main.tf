# resource = block name
# local = provider
# file = resource
# local_file = provider_resource
# cat = resource name
resource "local_file" "cat" {
  filename = "example/pets/cat.txt"
  content = "Hello World"
}

# resource "null_resource" "teste" {
#   # List
#   prefix = var.prefix[0]
#   # Map
#   pet_type = var.pet_type["cat"]
#   # Set
#   age = var.age[0]
#   # Object
#   owner = var.address
#   # Tuple
#   weight = var.size[0]
#   height = var.size[1]
# }

