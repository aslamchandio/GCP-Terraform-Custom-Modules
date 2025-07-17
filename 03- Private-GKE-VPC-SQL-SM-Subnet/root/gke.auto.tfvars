#machine_type = "e2-medium"
machine_type = {
  "test" = "e2-micro"
  "dev"  = "e2-small"
  "prod" = "e2-medium"
}

disk_type = "pd-balanced"
disk_size = 30

enable_private_endpoint = false
enable_private_nodes    = true

deletion_protection      = false
remove_default_node_pool = false

master_gke_version = "1.32.4-gke.1767000"
