terraform {
  backend "gcs" {
    bucket = "my-bucket"
    prefix = "project/cloudsql-project"
  }
}
