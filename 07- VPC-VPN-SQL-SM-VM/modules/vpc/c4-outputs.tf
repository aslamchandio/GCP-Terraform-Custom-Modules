# Project 1 VPC-1 Output

output "vpc1_name" {
  value       = google_compute_network.vpc1.name
  description = "The name of the VPC being created"
}

output "vpc1_id" {
  value = google_compute_network.vpc1.id
}

output "vpc1_self_link" {
  value       = google_compute_network.vpc1.self_link
  description = "The URI of the VPC being created"
}

# First Subnet Output

output "vpc1_subnet1_name" {
  value       = google_compute_subnetwork.subnet1.name
  description = "The name of the subnetwork"
}

output "vpc1_subnet1_cidr" {
  value       = google_compute_subnetwork.subnet1.ip_cidr_range
  description = "Primary CIDR range"
}

output "vpc1_subnet1_id" {
  description = "Subnet ID"
  value       = google_compute_subnetwork.subnet1.id
}

output "vpc1_subnet1_self_link" {
  value       = google_compute_subnetwork.subnet1.self_link
  description = "Primary CIDR range"
}


output "vpc1_pod_cidr1_name" {
  value       = google_compute_subnetwork.subnet1.secondary_ip_range[0].range_name
  description = "Name of the secondary CIDR range"
}

output "vpc1_pod_cidr1" {
  value       = google_compute_subnetwork.subnet1.secondary_ip_range[0].ip_cidr_range
  description = "Secondary CIDR range"
}
output "vpc1_pod_cidr2_name" {
  value       = google_compute_subnetwork.subnet1.secondary_ip_range[1].range_name
  description = "Name of the secondary CIDR range"
}

output "vpc1_pod_cidr2" {
  value       = google_compute_subnetwork.subnet1.secondary_ip_range[1].ip_cidr_range
  description = "Secondary CIDR range"
}

output "vpc1_service_cidr_name" {
  value       = google_compute_subnetwork.subnet1.secondary_ip_range[0].range_name
  description = "Name of the secondary CIDR range"
}

output "vpc1_service_cidr" {
  value       = google_compute_subnetwork.subnet1.secondary_ip_range[0].ip_cidr_range
  description = "Secondary CIDR range"
}

# Second Subnet Output

output "vpc1_subnet2_name" {
  value       = google_compute_subnetwork.subnet2.name
  description = "The name of the subnetwork"
}

output "vpc1_subnet2_cidr" {
  value       = google_compute_subnetwork.subnet2.ip_cidr_range
  description = "Primary CIDR range"
}

output "vpc1_subnet2_id" {
  description = "Subnet ID"
  value       = google_compute_subnetwork.subnet2.id
}

output "vpc1_subnet2_self_link" {
  value       = google_compute_subnetwork.subnet2.self_link
  description = "Primary CIDR range"
}


# Project 2 VPC-2 Output

output "vpc2_name" {
  value       = google_compute_network.vpc2.name
  description = "The name of the VPC being created"
}

output "vpc2_id" {
  value = google_compute_network.vpc2.id
}

output "vpc2_self_link" {
  value       = google_compute_network.vpc2.self_link
  description = "The URI of the VPC being created"
}

# First Subnet Output

output "vpc2_subnet3_name" {
  value       = google_compute_subnetwork.subnet3.name
  description = "The name of the subnetwork"
}

output "vpc2_subnet3_cidr" {
  value       = google_compute_subnetwork.subnet3.ip_cidr_range
  description = "Primary CIDR range"
}

output "vpc2_subnet3_id" {
  description = "Subnet ID"
  value       = google_compute_subnetwork.subnet3.id
}

output "vpc2_subnet3_self_link" {
  value       = google_compute_subnetwork.subnet3.self_link
  description = "Primary CIDR range"
}

output "vpc2_pod_cidr1_name" {
  value       = google_compute_subnetwork.subnet3.secondary_ip_range[0].range_name
  description = "Name of the secondary CIDR range"
}

output "vpc2_pod_cidr1" {
  value       = google_compute_subnetwork.subnet3.secondary_ip_range[0].ip_cidr_range
  description = "Secondary CIDR range"
}
output "vpc2_pod_cidr2_name" {
  value       = google_compute_subnetwork.subnet3.secondary_ip_range[1].range_name
  description = "Name of the secondary CIDR range"
}

output "vpc2_pod_cidr2" {
  value       = google_compute_subnetwork.subnet3.secondary_ip_range[1].ip_cidr_range
  description = "Secondary CIDR range"
}

output "vpc2_service_cidr_name" {
  value       = google_compute_subnetwork.subnet3.secondary_ip_range[0].range_name
  description = "Name of the secondary CIDR range"
}

output "vpc2_service_cidr" {
  value       = google_compute_subnetwork.subnet3.secondary_ip_range[0].ip_cidr_range
  description = "Secondary CIDR range"
}

# Second Subnet Output

output "vpc2_subnet4_name" {
  value       = google_compute_subnetwork.subnet4.name
  description = "The name of the subnetwork"
}

output "vpc2_subnet4_cidr" {
  value       = google_compute_subnetwork.subnet4.ip_cidr_range
  description = "Primary CIDR range"
}

output "vpc2_subnet4_id" {
  description = "Subnet ID"
  value       = google_compute_subnetwork.subnet4.id
}

output "vpc2_subnet4_self_link" {
  value       = google_compute_subnetwork.subnet4.self_link
  description = "Primary CIDR range"
}



