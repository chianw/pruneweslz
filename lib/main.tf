locals {
  architecture_definition_filename = "custom.alz_architecture_definition.json"
}

resource "local_file" "architecture_definition" {
  filename = local.architecture_definition_filename
  content = templatefile("${path.root}/lib/${local.architecture_definition_filename}", {
    prefix = var.prefix
  })
}