module "test" {
  source = "../.."

  service  = "test"
  location = var.gcp_region

  role = "roles/run.invoker"

  project = local.project_id

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
  ]

  authoritative = false
}
