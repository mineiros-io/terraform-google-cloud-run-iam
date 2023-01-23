module "test" {
  source = "../.."

  # add only required arguments and no optional arguments
  service  = "my-cloud-run-service"
  location = var.gcp_region
}
