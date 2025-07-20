
variable "subnet_cidrs" {
  type        = list(string)
  description = "Subnet CIDR values"
}


variable "pod_cidrs" {
  type        = list(string)
  description = "Subnet CIDR values"
}


variable "service_cidrs" {
  description = "US Central1 Region in which GCP Resources to be created"
  type        = list(string)
}


variable "source_ip_ranges" {
  type        = string
  description = "Source IP Address"
}




