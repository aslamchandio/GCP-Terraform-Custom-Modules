terraform {
  backend "gcs" {
    bucket = "my-bucket"
    prefix = "prod/gke-cluster-project"
  }
}
