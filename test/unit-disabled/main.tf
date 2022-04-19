module "test" {
  source = "../.."

  module_enabled = false

  # add all required arguments

  service  = "test"
  location = var.gcp_region

  # add all optional arguments that create additional/extended resources
}
