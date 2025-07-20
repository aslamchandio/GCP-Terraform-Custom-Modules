# Project-1 Firewall Rules

resource "google_compute_firewall" "vpc1_fw_ingress_ssh_allow" {
  name        = "${var.local_name}-${var.project_name_1}-fw-ingress-ssh-allow"
  network     = var.vpc_id_1
  description = "Creates firewall rule targeting SSH instances"
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = [var.source_ip_ranges]
  target_tags   = ["ssh-allow"]
  priority      = 1000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_firewall" "vpc1_fw_ingress_http_allow" {
  name        = "${var.local_name}-${var.project_name_1}-fw-ingress-http-allow"
  network     = var.vpc_id_1
  description = "Creates firewall rule targeting HTTP instances"
  allow {
    protocol = "tcp"
    ports    = ["80", "443", "8080", "9090"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-allow"]
  priority      = 1200

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_firewall" "vpc1_fw_ingress_internal_allow" {
  name        = "${var.local_name}-${var.project_name_1}-fw-ingress-internal-allow"
  network     = var.vpc_id_1
  description = "Creates firewall rule targeting Internal instances"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]

  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  source_ranges = [
    "${var.subnet1_cidr_range}",
    "${var.subnet2_cidr_range}",
    "${var.subnet3_cidr_range}",
    "${var.subnet4_cidr_range}"
  ]

  priority = 1300

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_firewall" "vpc1_fw_ingress_iap_allow" {
  name        = "${var.local_name}-${var.project_name_1}-fw-ingress-iap-allow"
  network     = var.vpc_id_1
  description = "Creates firewall rule targeting IAP instances"

  allow {
    protocol = "tcp"
    ports    = ["22", "3389"]
  }
  source_ranges = ["35.235.240.0/20"]
  target_tags   = ["iap-allow"]
  priority      = 1400

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_firewall" "vpc1_fw_egress_sql_deny" {
  name        = "${var.local_name}-${var.project_name_1}-fw-egress-sql-deny"
  network     = var.vpc_id_1
  description = "Creates firewall rule targeting MySql instances"

  deny {
    protocol = "tcp"
    ports    = ["3306"]
  }
  direction          = "EGRESS"
  destination_ranges = [var.cloudsql_cidr]
  priority           = 5000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_firewall" "vpc1_fw_egress_sql_allow" {
  name        = "${var.local_name}-${var.project_name_1}-fw-egress-sql-allow"
  network     = var.vpc_id_1
  description = "Creates firewall rule targeting MySql instances"

  allow {
    protocol = "tcp"
    ports    = ["3306"]
  }
  direction          = "EGRESS"
  destination_ranges = [var.cloudsql_cidr]
  target_tags        = ["sql-allow"]
  priority           = 1000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}



# Project-2 Firewall Rules


resource "google_compute_firewall" "vpc2_fw_ingress_ssh_allow" {
  project     = var.gcp_project_id_2
  name        = "${var.local_name}-${var.project_name_2}-fw-ingress-ssh-allow"
  network     = var.vpc_id_2
  description = "Creates firewall rule targeting SSH instances"
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = [var.source_ip_ranges]
  target_tags   = ["ssh-allow"]
  priority      = 1000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_firewall" "vpc2_fw_ingress_http_allow" {
  project     = var.gcp_project_id_2
  name        = "${var.local_name}-${var.project_name_2}-fw-ingress-http-allow"
  network     = var.vpc_id_2
  description = "Creates firewall rule targeting HTTP instances"
  allow {
    protocol = "tcp"
    ports    = ["80", "443", "8080", "9090"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-allow"]
  priority      = 1200

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_firewall" "vpc2_fw_ingress_internal_allow" {
  project     = var.gcp_project_id_2
  name        = "${var.local_name}-${var.project_name_2}-fw-ingress-internal-allow"
  network     = var.vpc_id_2
  description = "Creates firewall rule targeting Internal instances"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]

  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  source_ranges = [
    "${var.subnet1_cidr_range}",
    "${var.subnet2_cidr_range}",
    "${var.subnet3_cidr_range}",
    "${var.subnet4_cidr_range}"
  ]

  priority = 1300

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_firewall" "vpc2_fw_ingress_iap_allow" {
  project     = var.gcp_project_id_2
  name        = "${var.local_name}-${var.project_name_2}-fw-ingress-iap-allow"
  network     = var.vpc_id_2
  description = "Creates firewall rule targeting IAP instances"

  allow {
    protocol = "tcp"
    ports    = ["22", "3389"]
  }
  source_ranges = ["35.235.240.0/20"]
  target_tags   = ["iap-allow"]
  priority      = 1400

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_firewall" "vp2_fw_egress_sql_deny" {
  project     = var.gcp_project_id_2
  name        = "${var.local_name}-${var.project_name_2}-fw-egress-sql-deny"
  network     = var.vpc_id_2
  description = "Creates firewall rule targeting MySql instances"

  deny {
    protocol = "tcp"
    ports    = ["3306"]
  }
  direction          = "EGRESS"
  destination_ranges = [var.cloudsql_cidr]
  priority           = 5000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_firewall" "vpc2_fw_egress_sql_allow" {
  project     = var.gcp_project_id_2
  name        = "${var.local_name}-${var.project_name_2}-fw-egress-sql-allow"
  network     = var.vpc_id_2
  description = "Creates firewall rule targeting MySql instances"

  allow {
    protocol = "tcp"
    ports    = ["3306"]
  }
  direction          = "EGRESS"
  destination_ranges = [var.cloudsql_cidr]
  target_tags        = ["sql-allow"]
  priority           = 1000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}