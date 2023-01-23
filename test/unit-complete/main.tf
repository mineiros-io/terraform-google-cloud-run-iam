module "test-sa" {
  source = "github.com/mineiros-io/terraform-google-service-account?ref=v0.1.1"

  account_id = "service-account-id-${local.random_suffix}"
}

module "test1" {
  source = "../.."

  # add all required arguments
  service  = "my-cloud-run-service"
  location = var.gcp_region

  # add all optional arguments that create additional/extended resources
  members = [
    "allUsers",
    "allAuthenticatedUsers",
    "user:user@${local.org_domain}",
    "serviceAccount:service-account-name@${local.project_id}.iam.gserviceaccount.com",
    "group:group@${local.org_domain}",
    "domain:${local.org_domain}",
    "projectOwner:${local.project_id}",
    "projectEditor:${local.project_id}",
    "projectViewer:${local.project_id}",
    "computed:service-account-name@${local.project_id}.iam.gserviceaccount.com"
  ]

  computed_members_map = {
    myserviceaccount = "serviceAccount:${module.test-sa.service_account.email}"
  }

  role = "roles/run.admin"

  # add most/all other optional arguments
  project = local.project_id
}

module "test2" {
  source = "../.."

  # add all required arguments
  service  = "my-cloud-run-service"
  location = var.gcp_region

  # add all optional arguments that create additional/extended resources
  members = [
    "allUsers",
    "allAuthenticatedUsers",
    "user:user@${local.org_domain}",
    "serviceAccount:service-account-name@${local.project_id}.iam.gserviceaccount.com",
    "group:group@${local.org_domain}",
    "domain:${local.org_domain}",
    "projectOwner:${local.project_id}",
    "projectEditor:${local.project_id}",
    "projectViewer:${local.project_id}",
    "computed:service-account-name@${local.project_id}.iam.gserviceaccount.com"
  ]

  computed_members_map = {
    myserviceaccount = "serviceAccount:${module.test-sa.service_account.email}"
  }

  role = "roles/run.admin"

  authoritative = false

  # add most/all other optional arguments
  project = local.project_id
}

module "test3" {
  source = "../.."

  # add all required arguments
  service  = "my-cloud-run-service"
  location = var.gcp_region

  # add all optional arguments that create additional/extended resources
  computed_members_map = {
    myserviceaccount = "serviceAccount:${module.test-sa.service_account.email}"
  }

  policy_bindings = [{
    role    = "roles/run.admin"
    members = ["user:admin@${local.org_domain}"]
    condition = {
      expression = "request.time < timestamp(\"2024-01-01T00:00:00Z\")"
      title      = "expires_after_2023_12_31"
    }
  }]

  # add most/all other optional arguments
  project = local.project_id
}
