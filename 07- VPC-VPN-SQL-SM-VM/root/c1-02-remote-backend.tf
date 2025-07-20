terraform {
  backend "gcs" {
    bucket = "mybucket"
    prefix = "prod/vpn-project"
  }
}
