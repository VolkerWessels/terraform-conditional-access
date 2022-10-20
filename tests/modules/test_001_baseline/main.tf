module "test_core" {
  source = "../../../"

  library_path = var.library_path
  template_file_variables = var.template_file_variables
  named_locations = var.named_locations
}