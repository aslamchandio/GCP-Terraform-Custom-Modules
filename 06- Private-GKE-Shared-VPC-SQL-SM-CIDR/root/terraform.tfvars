gcp_project_id_1 = "abcd1234"
gcp_project_id_2 = "abcd5678"

gcp_region_1 = "us-central1"
gcp_region_2 = "us-west1"

gcp_zone_1 = "us-central1-f"
gcp_zone_2 = "us-west1-c"

project_2_sa_cs     = "123456788@cloudservices.gserviceaccount.com" #Cloud Service SA for Second Project
project_2_sa_cs_gs  = "service-123456788@compute-system.iam.gserviceaccount.com" # For Second Project
project_2_sa_gke_gs = "service-123456788@container-engine-robot.iam.gserviceaccount.com" # K8S Service Account for Second Project


environment      = "prod"
business_divsion = "it"

project_services = [
  "cloudresourcemanager.googleapis.com",
  "cloudbilling.googleapis.com",
  "serviceusage.googleapis.com",
  "compute.googleapis.com",
  "oslogin.googleapis.com",
  "container.googleapis.com",
  "containerregistry.googleapis.com",
  "iam.googleapis.com",
  "monitoring.googleapis.com",
  "networkconnectivity.googleapis.com",
  "networksecurity.googleapis.com",
  "networkservices.googleapis.com",
  "dns.googleapis.com",
  "certificatemanager.googleapis.com",
  "sql-component.googleapis.com",
  "sqladmin.googleapis.com",
  "servicenetworking.googleapis.com",
  "iap.googleapis.com",
  "storage-api.googleapis.com",
  "secretmanager.googleapis.com"
]

