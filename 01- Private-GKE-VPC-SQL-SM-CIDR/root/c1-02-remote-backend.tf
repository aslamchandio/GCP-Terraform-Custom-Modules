terraform {
  backend "gcs" {
    bucket = "my-bucket"
    prefix = "project/gke-project"
  }
}

