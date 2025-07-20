# Enabling the remaining APIs and services
resource "google_project_service" "project_services_1" {
  count                      = length(var.project_services)
  project                    = var.gcp_project_id_1
  service                    = var.project_services[count.index]
  disable_dependent_services = true

  disable_on_destroy = false
}

resource "google_project_service" "project_services_2" {
  count                      = length(var.project_services)
  project                    = var.gcp_project_id_2
  service                    = var.project_services[count.index]
  disable_dependent_services = true

  disable_on_destroy = false
}