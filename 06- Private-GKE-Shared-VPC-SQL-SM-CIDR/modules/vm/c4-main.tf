resource "google_compute_instance" "gke_vm" {
  project     = var.gcp_project_id_2
  name                      = "${var.local_name}-bastion1"
  zone                      = var.gcp_zone_2
  machine_type              = var.vm_machine_type_map["dev"]
  metadata_startup_script   = file("${path.module}/web-script.sh")
  allow_stopping_for_update = true
  tags = [
    tolist(var.firewall_tags_iap)[0],
    tolist(var.firewall_tags_sql)[0]
  ]

  network_interface {
    network    = var.vpc_id
    subnetwork = var.subnet2_self_link
    #access_config { network_tier = "STANDARD" }
  }

  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.self_link
      size  = var.vm_disk_size
      type  = var.vm_disk_type

    }

  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = var.sa_vm
    scopes = ["cloud-platform"]
  }

}

resource "google_compute_instance" "gke_vm1" {
  project     = var.gcp_project_id_2
  name                      = "${var.local_name}-bastion2"
  zone                      = var.gcp_zone_1
  machine_type              = var.vm_machine_type_map["dev"]
  metadata_startup_script   = file("${path.module}/web-script.sh")
  allow_stopping_for_update = true
   tags = [
    tolist(var.firewall_tags_iap)[0]
  ]

  network_interface {
    network    = var.vpc_id
    subnetwork = var.subnet3_self_link
    #access_config { network_tier = "STANDARD" }
  }

  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.self_link
      size  = var.vm_disk_size
      type  = var.vm_disk_type

    }

  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = var.sa_vm
    scopes = ["cloud-platform"]
  }

}
