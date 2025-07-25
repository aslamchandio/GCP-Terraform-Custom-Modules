# Terraform Settings Block
terraform {
  required_version = "~> 1.12.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.28.0"
    }
  }
}