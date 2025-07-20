resource "google_service_account" "vm_sa_1" {
  account_id   = var.sa_name_1
  display_name = "Service Account VM1"
}

resource "google_project_iam_member" "member-role1" {
  project = var.gcp_project_id_1
  for_each = toset([
    "roles/container.admin",
    "roles/iam.serviceAccountUser",
    "roles/iam.serviceAccountTokenCreator",
    "roles/artifactregistry.repoAdmin",
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/cloudsql.admin",
    "roles/storage.admin"

  ])
  role   = each.key
  member = "serviceAccount:${google_service_account.vm_sa_1.email}"
}
