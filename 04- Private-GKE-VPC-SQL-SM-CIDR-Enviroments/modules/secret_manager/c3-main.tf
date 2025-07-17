resource "google_secret_manager_secret" "db_user_pass_secret" {
  secret_id = "${var.local_name}-cloudsql-db-pass"
  labels = {
    env      = "${var.local_name}"
    app-name = "${var.local_name}-secret"
  }

  replication {
    user_managed {
      replicas {
        location = var.gcp_region_1
      }
      replicas {
        location = var.gcp_region_2
      }
    }
  }
}

resource "google_secret_manager_secret_version" "db_user_pass_version" {
  secret  = google_secret_manager_secret.db_user_pass_secret.id
  secret_data = var.cloudsql_db_pass
}


