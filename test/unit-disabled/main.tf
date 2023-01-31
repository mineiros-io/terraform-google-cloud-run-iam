module "test1" {
  source = "../.."

  # add all required arguments
  service  = "my-cloud-run-service"
  location = var.gcp_region

  # add all optional arguments that create additional/extended resources
  members = [
    "user:admin@${local.org_domain}",
  ]

  role = "roles/run.admin"

  # add most/all other optional arguments
  module_enabled = false
}

module "test2" {
  source = "../.."

  # add all required arguments
  service  = "my-cloud-run-service"
  location = var.gcp_region

  # add all optional arguments that create additional/extended resources
  members = [
    "user:admin@${local.org_domain}",
  ]

  role = "roles/run.admin"

  authoritative = false

  # add most/all other optional arguments
  module_enabled = false
}

module "test3" {
  source = "../.."

  # add all required arguments
  service  = "my-cloud-run-service"
  location = var.gcp_region

  # add all optional arguments that create additional/extended resources
  policy_bindings = [{
    role    = "roles/run.admin"
    members = ["user:admin@${local.org_domain}"]
    condition = {
      expression = "request.time < timestamp(\"2024-01-01T00:00:00Z\")"
      title      = "expires_after_2023_12_31"
    }
  }]

  # add most/all other optional arguments
  module_enabled = false
}
