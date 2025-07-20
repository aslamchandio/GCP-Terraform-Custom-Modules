# VPC Module OUTPUT VPC-1

output "vpc1_name" {
  value       = module.vpc.vpc1_name
  description = "The name of the VPC being created"
}

output "vpc1_id" {
  value = module.vpc.vpc1_id
}

output "vpc1_self_link" {
  value       = module.vpc.vpc1_self_link
  description = "The URI of the VPC being created"
}

## First Subnet Output

output "vpc1_subnet1_name" {
  value       = module.vpc.vpc1_subnet1_name
  description = "The name of the subnetwork"
}

output "vpc1_subnet1_cidr" {
  value       = module.vpc.vpc1_subnet1_cidr
  description = "Primary CIDR range"
}

output "vpc1_subnet1_id" {
  description = "Subnet ID"
  value       = module.vpc.vpc1_subnet1_id
}

output "vpc1_subnet1_self_link" {
  value       = module.vpc.vpc1_subnet1_self_link
  description = "Primary CIDR range"
}

output "vpc1_pod_cidr1_name" {
  value       = module.vpc.vpc1_pod_cidr1_name
  description = "Name of the secondary CIDR range"
}

output "vpc1_pod_cidr1_range" {
  value       = module.vpc.vpc1_pod_cidr1
  description = "Secondary CIDR range"
}
output "vpc1_pod_cidr2_name" {
  value       = module.vpc.vpc1_pod_cidr1_name
  description = "Name of the secondary CIDR range"
}

output "vpc1_pod_cidr2_range" {
  value       = module.vpc.vpc1_pod_cidr2
  description = "Secondary CIDR range"
}

output "vpc1_service_cidr_name" {
  value       = module.vpc.vpc1_service_cidr_name
  description = "Name of the secondary CIDR range"
}

output "vpc1_service_cidr_range" {
  value       = module.vpc.vpc1_service_cidr
  description = "Secondary CIDR range"
}

## Second Subnet Output

output "vpc1_subnet2_name" {
  value       = module.vpc.vpc1_subnet2_name
  description = "The name of the subnetwork"
}

output "vpc1_subnet2_cidr" {
  value       = module.vpc.vpc1_subnet2_cidr
  description = "Primary CIDR range"
}

output "vpc1_subnet2_self_link" {
  value       = module.vpc.vpc1_subnet2_self_link
  description = "Primary CIDR range"
}

output "vpc1_subnet2_id" {
  description = "Subnet ID"
  value       = module.vpc.vpc1_subnet2_id
}

# VPC Module OUTPUT VPC-2

output "vpc2_name" {
  value       = module.vpc.vpc2_name
  description = "The name of the VPC being created"
}

output "vpc2_id" {
  value = module.vpc.vpc2_id
}

output "vpc2_self_link" {
  value       = module.vpc.vpc2_self_link
  description = "The URI of the VPC being created"
}

## First Subnet Output

output "vpc2_subnet3_name" {
  value       = module.vpc.vpc2_subnet3_name
  description = "The name of the subnetwork"
}

output "vpc2_subnet3_cidr" {
  value       = module.vpc.vpc2_subnet3_cidr
  description = "Primary CIDR range"
}

output "vpc2_subnet3_id" {
  description = "Subnet ID"
  value       = module.vpc.vpc2_subnet3_id
}

output "vpc2_subnet3_self_link" {
  value       = module.vpc.vpc2_subnet3_self_link
  description = "Primary CIDR range"
}

output "vpc2_pod_cidr1_name" {
  value       = module.vpc.vpc2_pod_cidr1_name
  description = "Name of the secondary CIDR range"
}

output "vpc2_pod_cidr1_range" {
  value       = module.vpc.vpc2_pod_cidr1
  description = "Secondary CIDR range"
}
output "vpc2_pod_cidr2_name" {
  value       = module.vpc.vpc2_pod_cidr1_name
  description = "Name of the secondary CIDR range"
}

output "vpc2_pod_cidr2_range" {
  value       = module.vpc.vpc2_pod_cidr2
  description = "Secondary CIDR range"
}

output "vpc2_service_cidr_name" {
  value       = module.vpc.vpc2_service_cidr_name
  description = "Name of the secondary CIDR range"
}

output "vpc2_service_cidr_range" {
  value       = module.vpc.vpc2_service_cidr
  description = "Secondary CIDR range"
}

## Second Subnet Output

output "vpc2_subnet4_name" {
  value       = module.vpc.vpc2_subnet4_name
  description = "The name of the subnetwork"
}

output "vpc2_subnet4_cidr" {
  value       = module.vpc.vpc2_subnet4_cidr
  description = "Primary CIDR range"
}

output "vpc2_subnet4_self_link" {
  value       = module.vpc.vpc2_subnet4_self_link
  description = "Primary CIDR range"
}

output "vpc2_subnet4_id" {
  description = "Subnet ID"
  value       = module.vpc.vpc2_subnet4_id
}


# Firwwall Module OUTPUT

## For SSH Allow
output "vpc1_fw_ingress_ssh_name" {
  value       = module.firewall.vpc1_fw_ingress_ssh_name
  description = "The name of the firewall rule being created"
}

output "vpc1_fw_ingress_ssh_network" {
  value       = module.firewall.vpc1_fw_ingress_ssh_network
  description = "The name of the VPC network where the firewall rule will be applied"
}

output "vpc1_fw_ingress_ssh_self_link" {
  value       = module.firewall.vpc1_fw_ingress_ssh_self_link
  description = "The URI of the firewall rule  being created"
}


## For HTTP Allow
output "vpc1_fw_ingress_http_name" {
  value       = module.firewall.vpc1_fw_ingress_http_name
  description = "The name of the firewall rule being created"
}

output "vpc1_fw_ingress_http_network" {
  value       = module.firewall.vpc1_fw_ingress_http_network
  description = "The name of the VPC network where the firewall rule will be applied"
}

output "vpc1_fw_ingress_http_self_link" {
  value       = module.firewall.vpc1_fw_ingress_http_self_link
  description = "The URI of the firewall rule  being created"
}


## For Internal Allow
output "vpc1_fw_ingress_internal_name" {
  value       = module.firewall.vpc1_fw_ingress_internal_name
  description = "The name of the firewall rule being created"
}

output "vpc1_fw_ingress_internal_network" {
  value       = module.firewall.vpc1_fw_ingress_internal_network
  description = "The name of the VPC network where the firewall rule will be applied"
}

output "vpc1_fw_ingress_internal_self_link" {
  value       = module.firewall.vpc1_fw_ingress_internal_self_link
  description = "The URI of the firewall rule  being created"
}

## For IAP Allow
output "vpc1_fw_ingress_iap_name" {
  value       = module.firewall.vpc1_fw_ingress_iap_name
  description = "The name of the firewall rule being created"
}

output "vpc1_fw_ingress_iap_network" {
  value       = module.firewall.vpc1_fw_ingress_iap_network
  description = "The name of the VPC network where the firewall rule will be applied"
}

output "vpc1_fw_ingress_iap_self_link" {
  value       = module.firewall.vpc1_fw_ingress_iap_self_link
  description = "The URI of the firewall rule  being created"
}


# VM Module OUTPUT VM-1 & VM-2

output "vm1_private_ip" {
  value = module.vm.vm1_private_ip
}

output "vm1_public_ip" {
  value = module.vm.vm1_public_ip
}

output "vm2_private_ip" {
  value = module.vm.vm2_private_ip
}

# VM Module OUTPUT VM-1 & VM-2

output "vm3_private_ip" {
  value = module.vm.vm3_private_ip
}

output "vm3_public_ip" {
  value = module.vm.vm3_public_ip
}

output "vm4_private_ip" {
  value = module.vm.vm4_private_ip
}

## NatGW Module OUTPUT

output "natgw_public_ip1" {
  value       = module.natgw.natgw_public_ip1
  description = "The public IP address of the newly created Nat Gateway"
}

output "natgw_public_ip2" {
  value       = module.natgw.natgw_public_ip2
  description = "The public IP address of the newly created Nat Gateway"
}
