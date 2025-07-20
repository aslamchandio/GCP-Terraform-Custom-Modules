## VPC1
resource "google_compute_instance" "vm1" {
  name                      = "${var.local_name}-web1"
  zone                      = var.gcp_zone_1
  machine_type              = var.vm_machine_type_map["prod"]
  metadata_startup_script   = file("${path.module}/webserver1.sh")
  allow_stopping_for_update = true
  tags = [
    tolist(var.vpc1_fw_tags_ssh)[0],
    tolist(var.vpc1_fw_tags_http)[0]
  ]


  network_interface {
    network    = var.vpc_id_1
    subnetwork = var.subnet1_self_link
    access_config { network_tier = "STANDARD" }
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
    email  = var.sa_vm_1
    scopes = ["cloud-platform"]
  }

}

resource "google_compute_instance" "vm2" {
  name                      = "${var.local_name}-private1"
  zone                      = var.gcp_zone_2
  machine_type              = var.vm_machine_type_map["dev"]
  metadata_startup_script   = file("${path.module}/sqlscript.sh")
  allow_stopping_for_update = true
  tags = [
    tolist(var.vpc1_fw_tags_iap)[0],
    tolist(var.vpc1_fw_tags_sql)[0]
  ]

  network_interface {
    network    = var.vpc_id_1
    subnetwork = var.subnet2_self_link
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
    email  = var.sa_vm_1
    scopes = ["cloud-platform"]
  }

}

##VPC2

resource "google_compute_instance" "vm3" {
  project                   = var.gcp_project_id_2
  name                      = "${var.local_name}-web2"
  zone                      = var.gcp_zone_1
  machine_type              = var.vm_machine_type_map["prod"]
  metadata_startup_script   = file("${path.module}/webserver2.sh")
  allow_stopping_for_update = true
  tags = [
    tolist(var.vpc2_fw_tags_ssh)[0],
    tolist(var.vpc2_fw_tags_http)[0]
  ]


  network_interface {
    network    = var.vpc_id_2
    subnetwork = var.subnet3_self_link
    access_config { network_tier = "STANDARD" }
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
    email  = var.sa_vm_2
    scopes = ["cloud-platform"]
  }

}

resource "google_compute_instance" "vm4" {
  project                   = var.gcp_project_id_2
  name                      = "${var.local_name}-private2"
  zone                      = var.gcp_zone_3
  machine_type              = var.vm_machine_type_map["dev"]
  metadata_startup_script   = file("${path.module}/sqlscript.sh")
  allow_stopping_for_update = true
  tags = [
    tolist(var.vpc2_fw_tags_iap)[0],
    tolist(var.vpc2_fw_tags_sql)[0]
  ]


  network_interface {
    network    = var.vpc_id_2
    subnetwork = var.subnet4_self_link
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
    email  = var.sa_vm_2
    scopes = ["cloud-platform"]
  }

}
