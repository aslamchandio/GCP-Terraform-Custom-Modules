# Module: VPC
module "vpc" {
  source = "../modules/vpc"

  local_name = local.name

  gcp_project_id_1 = var.gcp_project_id_1
  gcp_project_id_2 = var.gcp_project_id_2

  project_name_1 = var.project_name_1
  project_name_2 = var.project_name_2

  gcp_region_1 = var.gcp_region_1
  gcp_region_2 = var.gcp_region_2
  gcp_region_3 = var.gcp_region_3

  subnet_cidrs  = var.subnet_cidrs
  pod_cidrs     = var.pod_cidrs
  service_cidrs = var.service_cidrs

}

# Module: Firewall
module "firewall" {
  source = "../modules/firewall"


  local_name = local.name

  gcp_project_id_1 = var.gcp_project_id_1
  gcp_project_id_2 = var.gcp_project_id_2

  project_name_1 = var.project_name_1
  project_name_2 = var.project_name_2

  vpc_id_1 = module.vpc.vpc1_id
  vpc_id_2 = module.vpc.vpc2_id

  subnet1_cidr_range = module.vpc.vpc1_subnet1_cidr
  subnet2_cidr_range = module.vpc.vpc1_subnet2_cidr
  subnet3_cidr_range = module.vpc.vpc2_subnet3_cidr
  subnet4_cidr_range = module.vpc.vpc2_subnet4_cidr

  source_ip_ranges = var.source_ip_ranges
  cloudsql_cidr    = var.cloudsql_cidr
}

# Module: VM

module "vm" {
  source = "../modules/vm"

  gcp_project_id_1 = var.gcp_project_id_1
  gcp_project_id_2 = var.gcp_project_id_2

  gcp_zone_1 = var.gcp_zone_1
  gcp_zone_2 = var.gcp_zone_2
  gcp_zone_3 = var.gcp_zone_3

  local_name = local.name

  vpc_id_1 = module.vpc.vpc1_id
  vpc_id_2 = module.vpc.vpc2_id

  subnet1_self_link = module.vpc.vpc1_subnet1_self_link
  subnet2_self_link = module.vpc.vpc1_subnet2_self_link

  subnet3_self_link = module.vpc.vpc2_subnet3_self_link
  subnet4_self_link = module.vpc.vpc2_subnet4_self_link

  vpc1_fw_tags_ssh  = module.firewall.vpc1_fw_ingress_ssh_target_tags
  vpc1_fw_tags_http = module.firewall.vpc1_fw_ingress_http_target_tags
  vpc1_fw_tags_iap  = module.firewall.vpc1_fw_ingress_iap_target_tags
  vpc1_fw_tags_sql  = module.firewall.vpc1_fw_egress_sql_target_tags

  vpc2_fw_tags_ssh  = module.firewall.vpc2_fw_ingress_ssh_target_tags
  vpc2_fw_tags_http = module.firewall.vpc2_fw_ingress_http_target_tags
  vpc2_fw_tags_iap  = module.firewall.vpc2_fw_ingress_iap_target_tags
  vpc2_fw_tags_sql  = module.firewall.vpc2_fw_egress_sql_target_tags

  vm_machine_type_map = var.vm_machine_type_map

  vm_disk_type = var.vm_disk_type

  vm_disk_size = var.vm_disk_size

  sa_vm_1 = module.sa_vm_proj1.vm_sa_1
  sa_vm_2 = module.sa_vm_proj2.vm_sa_2

}

# Module: Service Account for VM Project-1

module "sa_vm_proj1" {
  source = "../modules/sa_vm_proj1"


  gcp_project_id_1 = var.gcp_project_id_1

  sa_name_1 = "${local.name}-vm-proj1-sa"

}

# Module: Service Account for VM Project-2

module "sa_vm_proj2" {
  source = "../modules/sa_vm_proj2"

  gcp_project_id_2 = var.gcp_project_id_2

  sa_name_2 = "${local.name}-vm-proj2-sa"

}

# Module: Cloud Gateway for Two Regions
module "natgw" {
  source = "../modules/natgw"

  local_name = local.name

  gcp_project_id_1 = var.gcp_project_id_1
  gcp_project_id_2 = var.gcp_project_id_2

  gcp_region_2 = var.gcp_region_2
  gcp_region_3 = var.gcp_region_3

  vpc_id_1 = module.vpc.vpc1_id
  vpc_id_2 = module.vpc.vpc2_id

  vpc1_subnet2_id = module.vpc.vpc1_subnet2_id
  vpc2_subnet4_id = module.vpc.vpc2_subnet4_id

}



# Module: Cloud SQL
module "cloud_sql" {
  source = "../modules/cloud_sql"

  local_name = local.name

  gcp_project_id_1 = var.gcp_project_id_1
  gcp_region_1     = var.gcp_region_1

  vpc_id_1       = module.vpc.vpc1_id
  vpc_name_1     = module.vpc.vpc1_name
  vpc1_self_link = module.vpc.vpc1_self_link

  cloudsql_db_version               = var.cloudsql_db_version
  cloudsql_db_tier                  = var.cloudsql_db_tier
  cloudsql_db_disk_size             = var.cloudsql_db_disk_size
  cloudsql_db_disk_type             = var.cloudsql_db_disk_type
  cloudsql_db_disk_autoresize       = var.cloudsql_db_disk_autoresize
  cloudsql_db_disk_autoresize_limit = var.cloudsql_db_disk_autoresize_limit

  private_ip_range = var.private_ip_range

  db_secret_data = module.secret_manager.db_secret_data

}

# Module: Secret Manager
module "secret_manager" {
  source = "../modules/secret_manager"

  local_name   = local.name
  gcp_region_1 = var.gcp_region_1
  gcp_region_2 = var.gcp_region_2

  cloudsql_db_pass = var.cloudsql_db_pass
}


# Module: HA VPN

module "ha_vpn" {
  source = "../modules/ha_vpn"

  local_name = local.name

  gcp_project_id_1 = var.gcp_project_id_1
  gcp_project_id_2 = var.gcp_project_id_2

  project_name_1 = var.project_name_1
  project_name_2 = var.project_name_2

  gcp_region_1 = var.gcp_region_1

  vpc_id_1 = module.vpc.vpc1_id
  vpc_id_2 = module.vpc.vpc2_id

  vpc_name_1 = module.vpc.vpc1_name
  vpc_name_2 = module.vpc.vpc2_name

  cloudsql_cidr = var.cloudsql_cidr

}