# Project-1 VPC

resource "google_compute_network" "vpc1" {
  name                            = "${var.local_name}-${var.project_name_1}-vpc"
  auto_create_subnetworks         = false
  mtu                             = 1460
  routing_mode                    = "GLOBAL" # "REGIONAL" 
  delete_default_routes_on_create = true
}

resource "google_compute_subnetwork" "subnet1" {
  name                     = "${var.local_name}-${var.project_name_1}-${var.gcp_region_1}-subnet1"
  region                   = var.gcp_region_1
  ip_cidr_range            = var.subnet_cidrs[0]
  network                  = google_compute_network.vpc1.id
  private_ip_google_access = true
  stack_type               = "IPV4_ONLY"

  secondary_ip_range {
    range_name    = "pod-cidr1"
    ip_cidr_range = var.pod_cidrs[0]
  }

  secondary_ip_range {
    range_name    = "pod-cidr2"
    ip_cidr_range = var.pod_cidrs[1]
  }

  secondary_ip_range {
    range_name    = "service-cidr"
    ip_cidr_range = var.service_cidrs[0]
  }

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }

}


resource "google_compute_subnetwork" "subnet2" {
  name                     = "${var.local_name}-${var.project_name_1}-${var.gcp_region_2}-subnet2"
  region                   = var.gcp_region_2
  ip_cidr_range            = var.subnet_cidrs[1]
  network                  = google_compute_network.vpc1.id
  private_ip_google_access = true
  stack_type               = "IPV4_ONLY"

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_route" "internet_route_1" {
  name             = "${var.local_name}-${var.project_name_1}-egress-igw"
  description      = "route through IGW to access internet"
  dest_range       = "0.0.0.0/0"
  network          = google_compute_network.vpc1.id
  next_hop_gateway = "default-internet-gateway"
  priority         = 100
}

# Project-2 VPC

resource "google_compute_network" "vpc2" {
  name                            = "${var.local_name}-${var.project_name_2}-vpc"
  project                         = var.gcp_project_id_2
  auto_create_subnetworks         = false
  mtu                             = 1460
  routing_mode                    = "GLOBAL" # "REGIONAL" 
  delete_default_routes_on_create = true
}

resource "google_compute_subnetwork" "subnet3" {
  name                     = "${var.local_name}-${var.project_name_2}-${var.gcp_region_1}-subnet1"
  project                  = var.gcp_project_id_2
  region                   = var.gcp_region_1
  ip_cidr_range            = var.subnet_cidrs[2]
  network                  = google_compute_network.vpc2.id
  private_ip_google_access = true
  stack_type               = "IPV4_ONLY"

  secondary_ip_range {
    range_name    = "pod-cidr1"
    ip_cidr_range = var.pod_cidrs[2]
  }

  secondary_ip_range {
    range_name    = "pod-cidr2"
    ip_cidr_range = var.pod_cidrs[3]
  }

  secondary_ip_range {
    range_name    = "service-cidr"
    ip_cidr_range = var.service_cidrs[1]
  }

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }

}


resource "google_compute_subnetwork" "subnet4" {
  name                     = "${var.local_name}-${var.project_name_2}-${var.gcp_region_3}-subnet2"
  project                  = var.gcp_project_id_2
  region                   = var.gcp_region_3
  ip_cidr_range            = var.subnet_cidrs[3]
  network                  = google_compute_network.vpc2.id
  private_ip_google_access = true
  stack_type               = "IPV4_ONLY"

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_route" "internet_route_2" {
  name             = "${var.local_name}-${var.project_name_2}-egress-igw"
  project          = var.gcp_project_id_2
  description      = "route through IGW to access internet"
  dest_range       = "0.0.0.0/0"
  network          = google_compute_network.vpc2.id
  next_hop_gateway = "default-internet-gateway"
  priority         = 100
}

