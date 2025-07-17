# Module: VPC
module "vpc" {
  source = "../modules/vpc"

  local_name = local.name

  gcp_project_id = var.gcp_project_id
  gcp_region_1   = var.gcp_region_1
  gcp_region_2   = var.gcp_region_2

  subnet_cidrs = var.subnet_cidrs
  pod_cidrs    = var.pod_cidrs
  service_cidr = var.service_cidr

}

# Module: Firewall
module "firewall" {
  source = "../modules/firewall"
  
  local_name = local.name

  gcp_project_id = var.gcp_project_id
  
  vpc_id = module.vpc.vpc_id

  subnet1_cidr_range = module.vpc.subnet1_cidr
  subnet2_cidr_range = module.vpc.subnet2_cidr
  proxy_cidr_range   = module.vpc.regional_proxy_subnet_cidr

  source_ip_ranges = var.source_ip_ranges

}

# Module: VM

module "vm" {
  source = "../modules/vm"

  project_id = var.gcp_project_id

  gcp_zone_1 = var.gcp_zone_1
  gcp_zone_2 = var.gcp_zone_2

  local_name = local.name

  vpc_id = module.vpc.vpc_id

  subnet2_self_link = module.vpc.subnet2_self_link
  subnet3_self_link = module.vpc.subnet3_self_link

  vm_machine_type_map = var.vm_machine_type_map

  vm_disk_type = var.vm_disk_type

  vm_disk_size = var.vm_disk_size

  sa_vm = module.sa_vm.vm_sa

  firewall_tags_iap = module.firewall.fw_ingress_iap_target_tags
  firewall_tags_sql = module.firewall.fw_egress_sql_target_tags
}

# Module: GKE Cluster
module "gke_cluster" {
  source = "../modules/gke_cluster"


  gcp_project_id = var.gcp_project_id
  gcp_region_1   = var.gcp_region_1

  local_name = local.name


  # Network
  vpc_id                = module.vpc.vpc_id
  subnet1_id            = module.vpc.subnet1_id
  subnet2_ip_cidr_range = module.vpc.subnet2_cidr
  subnet3_ip_cidr_range = module.vpc.subnet3_cidr

  # In production, change it to true (Enable it to avoid accidental deletion)
  deletion_protection      = var.deletion_protection
  remove_default_node_pool = var.remove_default_node_pool
  master_gke_version       = var.master_gke_version

  # Private Cluster Configurations
  enable_private_endpoint = var.enable_private_endpoint
  enable_private_nodes    = var.enable_private_nodes
  master_subnet           = module.vpc.master_subnet_self_link

  # IP Address Ranges
  cluster_secondary_range_name  = module.vpc.pod_cidr1_name
  services_secondary_range_name = module.vpc.service_cidr_name

  # Allow access to Kubernetes master API Endpoint
  master_authorized_ip_range = var.source_ip_ranges

  gke_sa_name = module.sa_gke.gke_sa

  firewall_tags_iap = module.firewall.fw_ingress_iap_target_tags
  firewall_tags_sql = module.firewall.fw_egress_sql_target_tags

}

# Module: GKE Node POOl
module "gke_np" {

  source = "../modules/gke_np"


  cluster_name = module.gke_cluster.gke_cluster_name

  gcp_project_id = var.gcp_project_id
  gcp_region_1   = var.gcp_region_1
  gcp_region_2   = var.gcp_region_2

  local_name = local.name

  machine_type = var.machine_type
  disk_type    = var.disk_type
  disk_size    = var.disk_size

  gke_sa_name = module.sa_gke.gke_sa

  firewall_tags_iap = module.firewall.fw_ingress_iap_target_tags
  firewall_tags_sql = module.firewall.fw_egress_sql_target_tags

}

# Module: Service Account for VM
module "sa_vm" {
  source = "../modules/sa_vm"

  project_id = var.gcp_project_id

  sa_name = "${local.name}-gke-sa-admin"

}

# Module: Service Account for GKE Node Pools
module "sa_gke" {
  source = "../modules/sa_gke"

  project_id = var.gcp_project_id

  sa_name = "${local.name}-gke-sa-np"

}

# Module: Cloud Gateway for Two Regions
module "natgw" {
  source = "../modules/natgw"

  local_name = local.name

  gcp_project_id = var.gcp_project_id
  gcp_region_1   = var.gcp_region_1
  gcp_region_2   = var.gcp_region_2

  vpc_id     = module.vpc.vpc_id
  subnet1_id = module.vpc.subnet1_id
  subnet2_id = module.vpc.subnet2_id
  subnet3_id = module.vpc.subnet3_id
}

# Module: Secret Manager
module "secret_manager" {
  source = "../modules/secret_manager"

  local_name   = local.name
  gcp_region_1 = var.gcp_region_1
  gcp_region_2 = var.gcp_region_2

  cloudsql_db_pass = var.cloudsql_db_pass
}

# Module: VPC
module "cloud_sql" {
  source = "../modules/cloud_sql"

  local_name = local.name

  gcp_project_id = var.gcp_project_id
  gcp_region_1   = var.gcp_region_1
  gcp_region_2   = var.gcp_region_2

  vpc_id                            = module.vpc.vpc_id
  vpc_self_link                     = module.vpc.vpc_self_link
  cloudsql_db_version               = var.cloudsql_db_version
  cloudsql_db_tier                  = var.cloudsql_db_tier
  cloudsql_db_disk_size             = var.cloudsql_db_disk_size
  cloudsql_db_disk_type             = var.cloudsql_db_disk_type
  cloudsql_db_disk_autoresize       = var.cloudsql_db_disk_autoresize
  cloudsql_db_disk_autoresize_limit = var.cloudsql_db_disk_autoresize_limit

  private_ip_range = var.private_ip_range

  db_secret_data = module.secret_manager.db_secret_data

}