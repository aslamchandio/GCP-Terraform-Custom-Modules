##### Project-1 HA VPN #####

resource "google_compute_ha_vpn_gateway" "ha_gateway1" {
  name    = "${var.local_name}-${var.project_name_1}-vpngtw1"
  region  = var.gcp_region_1
  network = var.vpc_id_1
}

resource "google_compute_router" "router1" {
  name    = "${var.local_name}-${var.project_name_1}-router1"
  region  = var.gcp_region_1
  network = var.vpc_name_1
  bgp {
    asn = 64514
    advertise_mode    = "CUSTOM"
    advertised_groups = ["ALL_SUBNETS"]
    advertised_ip_ranges { 
      range = var.cloudsql_cidr
    }
  }
}

# For Tunnel-0 VPC1

resource "google_compute_vpn_tunnel" "vpc1_tunnel0" {
  name                  = "${var.local_name}-${var.project_name_1}-tunnel0"
  region                = var.gcp_region_1
  vpn_gateway           = google_compute_ha_vpn_gateway.ha_gateway1.id
  peer_gcp_gateway      = google_compute_ha_vpn_gateway.ha_gateway2.id
  shared_secret         = "Abcd1234"
  router                = google_compute_router.router1.id
  vpn_gateway_interface = 0
}

# For Tunnel-0 & Interface-0 FOR VPC1

resource "google_compute_router_interface" "router1_interface0" {
  name       = "${var.local_name}-${var.project_name_1}-if-tunnel0"
  router     = google_compute_router.router1.name
  region     = var.gcp_region_1
  ip_range   = "169.254.0.1/30"
  vpn_tunnel = google_compute_vpn_tunnel.vpc1_tunnel0.name
}

resource "google_compute_router_peer" "router1_peer1" {
  name                      = "${var.local_name}-${var.project_name_1}-bgp-tunnel0"
  router                    = google_compute_router.router1.name
  region                    = var.gcp_region_1
  peer_ip_address           = "169.254.0.2"
  peer_asn                  = 64515
  advertised_route_priority = 100
  interface                 = google_compute_router_interface.router1_interface0.name
}

# For Tunnel-1 VPC1

resource "google_compute_vpn_tunnel" "vpc1_tunnel1" {
  name                  = "${var.local_name}-${var.project_name_1}-tunnel1"
  region                = var.gcp_region_1
  vpn_gateway           = google_compute_ha_vpn_gateway.ha_gateway1.id
  peer_gcp_gateway      = google_compute_ha_vpn_gateway.ha_gateway2.id
  shared_secret         = "Abcd1234"
  router                = google_compute_router.router1.id
  vpn_gateway_interface = 1
}

# For Tunnel-1 & Interface-1 FOR VPC1

resource "google_compute_router_interface" "router1_interface1" {
  name       = "${var.local_name}-${var.project_name_1}-if-tunnel1"
  router     = google_compute_router.router1.name
  region     = var.gcp_region_1
  ip_range   = "169.254.1.1/30"
  vpn_tunnel = google_compute_vpn_tunnel.vpc1_tunnel1.name
}

resource "google_compute_router_peer" "router1_peer2" {
  name                      = "${var.local_name}-${var.project_name_1}-bgp-tunnel1"
  router                    = google_compute_router.router1.name
  region                    = var.gcp_region_1
  peer_ip_address           = "169.254.1.2"
  peer_asn                  = 64515
  advertised_route_priority = 100
  interface                 = google_compute_router_interface.router1_interface1.name
}

##### Project-2 HA VPN #####

resource "google_compute_ha_vpn_gateway" "ha_gateway2" {
  project = var.gcp_project_id_2
  name    = "${var.local_name}-${var.project_name_2}-vpngtw2"
  region  = var.gcp_region_1
  network = var.vpc_id_2
}

resource "google_compute_router" "router2" {
  project = var.gcp_project_id_2
  name    = "${var.local_name}-${var.project_name_2}-router2"
  region  = var.gcp_region_1
  network = var.vpc_name_2
  bgp {
    asn = 64515
  }
}

# For Tunnel-0 VPC2

resource "google_compute_vpn_tunnel" "vpc2_tunnel0" {
  project               = var.gcp_project_id_2
  name                  = "${var.local_name}-${var.project_name_2}-tunnel0"
  region                = var.gcp_region_1
  vpn_gateway           = google_compute_ha_vpn_gateway.ha_gateway2.id
  peer_gcp_gateway      = google_compute_ha_vpn_gateway.ha_gateway1.id
  shared_secret         = "Abcd1234"
  router                = google_compute_router.router2.id
  vpn_gateway_interface = 0
}

# For Tunnel-0 & Interface-0 FOR VPC2

resource "google_compute_router_interface" "router2_interface0" {
  project    = var.gcp_project_id_2
  name       = "${var.local_name}-${var.project_name_2}-if-tunnel0"
  router     = google_compute_router.router2.name
  region     = var.gcp_region_1
  ip_range   = "169.254.0.2/30"
  vpn_tunnel = google_compute_vpn_tunnel.vpc2_tunnel0.name
}

resource "google_compute_router_peer" "router2_peer1" {
  project                   = var.gcp_project_id_2
  name                      = "${var.local_name}-${var.project_name_2}-bgp-tunnel0"
  router                    = google_compute_router.router2.name
  region                    = var.gcp_region_1
  peer_ip_address           = "169.254.0.1"
  peer_asn                  = 64514
  advertised_route_priority = 100
  interface                 = google_compute_router_interface.router2_interface0.name
}

# For Tunnel-1 VPC2

resource "google_compute_vpn_tunnel" "vpc2_tunnel1" {
  project               = var.gcp_project_id_2
  name                  = "${var.local_name}-${var.project_name_2}-tunnel1"
  region                = var.gcp_region_1
  vpn_gateway           = google_compute_ha_vpn_gateway.ha_gateway2.id
  peer_gcp_gateway      = google_compute_ha_vpn_gateway.ha_gateway1.id
  shared_secret         = "Abcd1234"
  router                = google_compute_router.router2.id
  vpn_gateway_interface = 1
}

# For Tunnel-1 & Interface-1 FOR VPC2

resource "google_compute_router_interface" "router2_interface1" {
  project    = var.gcp_project_id_2
  name       = "${var.local_name}-${var.project_name_2}-if-tunnel1"
  router     = google_compute_router.router2.name
  region     = var.gcp_region_1
  ip_range   = "169.254.1.2/30"
  vpn_tunnel = google_compute_vpn_tunnel.vpc2_tunnel1.name
}

resource "google_compute_router_peer" "router2_peer2" {
  project                   = var.gcp_project_id_2
  name                      = "${var.local_name}-${var.project_name_2}-bgp-tunnel1"
  router                    = google_compute_router.router2.name
  region                    = var.gcp_region_1
  peer_ip_address           = "169.254.1.1"
  peer_asn                  = 64514
  advertised_route_priority = 100
  interface                 = google_compute_router_interface.router2_interface1.name
}  