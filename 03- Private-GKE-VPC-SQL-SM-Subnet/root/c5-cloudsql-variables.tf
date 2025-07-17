# Cloud SQL Database version

variable "cloudsql_db_version" {
  description = "Cloud SQL MySQL DB Database version"
  type        = string
}

variable "cloudsql_db_tier" {
  description = "Cloud SQL MySQL DB Database tier"
  type        = string
}

variable "cloudsql_db_disk_size" {
  description = "Cloud SQL MySQL DB Database Disk Size"
  type        = number
}

variable "cloudsql_db_disk_type" {
  description = "Cloud SQL MySQL DB Database Disk Type"
  type        = string
}

variable "cloudsql_db_disk_autoresize" {
  description = "Cloud SQL MySQL DB Database Disk Size"
  type        = bool
}

variable "cloudsql_db_disk_autoresize_limit" {
  description = "Cloud SQL MySQL DB Database Disk Size"
  type        = number
}

variable "private_ip_range" {
  description = "Compute Engine Machine Type"
  type        = string
}

variable "cloudsql_db_pass" {
  description = "Cloud SQL MySQL DB Database tier"
  type        = string
  sensitive   = true
}
