terraform {
  backend "gcs" {
    bucket = "my-bucket"
    prefix = "dev/gke-project"
  }
}

