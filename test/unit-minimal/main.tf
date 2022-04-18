module "test" {
  source = "../.."

  # add only required arguments and no optional arguments

  service  = "test"
  location = var.gcp_region

  role = "roles/run.invoker"
}
