resource "google_compute_global_address" "private_ip_address" {
  provider      = google-beta
  project       = var.gcp_project_id_1
  name          = "google-managed-services-${var.local_name}-range1"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  address       = var.private_ip_range
  network       = var.vpc_id_1


}

resource "google_service_networking_connection" "private_vpc_connection" {

  provider                = google-beta
  network                 = var.vpc_id_1
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]

}

resource "google_compute_network_peering_routes_config" "peering_routes" {
  provider = google-beta
  project  = var.gcp_project_id_1
  peering  = google_service_networking_connection.private_vpc_connection.peering
  network  = var.vpc_name_1

  import_custom_routes = true
  export_custom_routes = true
}