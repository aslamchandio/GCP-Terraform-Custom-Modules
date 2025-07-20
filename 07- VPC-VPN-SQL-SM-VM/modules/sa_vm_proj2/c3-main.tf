resource "google_service_account" "vm_sa_2" {
  project      = var.gcp_project_id_2
  account_id   = var.sa_name_2
  display_name = "Service Account VM2"
}

resource "google_project_iam_member" "member-role2" {
  project = var.gcp_project_id_2
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
  member = "serviceAccount:${google_service_account.vm_sa_2.email}"
}

