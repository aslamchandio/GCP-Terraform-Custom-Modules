resource "google_service_account" "gke_sa" {
  project  = var.gcp_project_id_2
  account_id   = var.sa_name
  display_name = "Service Account VM"
}

resource "google_project_iam_member" "member-role" {
  project  = var.gcp_project_id_2
  role    = each.key
  for_each = toset([
    "roles/iam.serviceAccountUser",
    "roles/iam.serviceAccountTokenCreator",
    "roles/artifactregistry.repoAdmin",
    "roles/container.defaultNodeServiceAccount",
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/storage.admin"
  ])
  member  = "serviceAccount:${google_service_account.gke_sa.email}"
}

