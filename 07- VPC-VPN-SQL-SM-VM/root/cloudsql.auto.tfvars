cloudsql_db_version               = "MYSQL_8_0"
cloudsql_db_tier                  = "db-n1-standard-1"
cloudsql_db_disk_size             = 20
cloudsql_db_disk_type             = "PD_SSD"
cloudsql_db_disk_autoresize       = true
cloudsql_db_disk_autoresize_limit = 60

private_ip_range = "10.86.0.0"
cloudsql_cidr    = "10.86.0.0/16"