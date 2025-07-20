# A host project provides network resources to associated service projects.
resource "google_compute_shared_vpc_host_project" "host_project" {
  project = var.gcp_project_id_1
}

# A service project gains access to network resources provided by its
# associated host project.
resource "google_compute_shared_vpc_service_project" "service_project" {
  host_project    = google_compute_shared_vpc_host_project.host_project.project
  service_project = var.gcp_project_id_2

  depends_on = [google_compute_shared_vpc_host_project.host_project]
}

## Give Access Service Acccount on Host Project Subnet1
resource "google_compute_subnetwork_iam_member" "member_1" {
  project    = var.gcp_project_id_1
  region     = var.gcp_region_1
  subnetwork = var.subnet1_id
  role       = "roles/compute.networkUser"
  member     = "serviceAccount:${var.project_2_sa_cs}"
}

## Give Access Service Acccount on Host Project Subnet2
resource "google_compute_subnetwork_iam_member" "member_2" {
  project    = var.gcp_project_id_1
  region     = var.gcp_region_2
  subnetwork = var.subnet2_id
  role       = "roles/compute.networkUser"
  member     = "serviceAccount:${var.project_2_sa_cs}"
}

## Give Access Service Acccount on Host Project Proxy Subnet
resource "google_compute_subnetwork_iam_member" "member_3" {
  project    = var.gcp_project_id_1
  region     = var.gcp_region_1
  subnetwork = var.regional_proxy_subnet_id
  role       = "roles/compute.networkUser"
  member     = "serviceAccount:${var.project_2_sa_cs}"
}

## Give Access Service Acccount on Host Project Subnet1
resource "google_compute_subnetwork_iam_member" "member_4" {
  project    = var.gcp_project_id_1
  region     = var.gcp_region_1
  subnetwork = var.subnet1_id
  role       = "roles/compute.networkUser"
  member     = "serviceAccount:${var.project_2_sa_cs_gs}"
}


## Give Access Service Acccount on Host Project Subnet2
resource "google_compute_subnetwork_iam_member" "member_5" {
  project    = var.gcp_project_id_1
  region     = var.gcp_region_2
  subnetwork = var.subnet2_id
  role       = "roles/compute.networkUser"
  member     = "serviceAccount:${var.project_2_sa_cs_gs}"
}

## Give Access Service Acccount on Host Project Proxy Subnet
resource "google_compute_subnetwork_iam_member" "member_6" {
  project    = var.gcp_project_id_1
  region     = var.gcp_region_1
  subnetwork = var.regional_proxy_subnet_id
  role       = "roles/compute.networkUser"
  member     = "serviceAccount:${var.project_2_sa_cs_gs}"
}



## Give Access Service Acccount on Host Project Subnet1
resource "google_compute_subnetwork_iam_member" "member_7" {
  project    = var.gcp_project_id_1
  region     = var.gcp_region_1
  subnetwork = var.subnet1_id
  role       = "roles/compute.networkUser"
  member     = "serviceAccount:${var.project_2_sa_gke_gs}"
}

## Give Access Service Acccount on Host Project Subnet1
resource "google_compute_subnetwork_iam_member" "member_8" {
  project    = var.gcp_project_id_1
  region     = var.gcp_region_1
  subnetwork = var.regional_proxy_subnet_id
  role       = "roles/compute.networkUser"
  member     = "serviceAccount:${var.project_2_sa_gke_gs}"
}


/*

resource "google_project_iam_member" "project-tf" {
  project = var.gcp_project_id_1
  role    = each.key
  for_each = toset([
    "roles/container.hostServiceAgentUser",
    "roles/compute.securityAdmin"
  ])
  member = "serviceAccount:${var.project_2_sa_gke_gs}"

}

*/




