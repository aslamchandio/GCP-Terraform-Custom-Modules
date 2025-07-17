# Terraform Settings Block
terraform {
  required_version = "~> 1.12.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.28.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~>4"
      #version = "~> 5.0"
    }
  }
}

# Terraform Provider Block
provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region_1
}