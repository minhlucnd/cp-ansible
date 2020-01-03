
resource "google_compute_instance" "control_center" {
  name         = "control-center"
  machine_type = "n1-standard-2"
  tags = ["confluent"]
  project = var.project
  zone = var.zone
labels = {
    "stack":"confluent",
    "ansible_group":"control_center"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }


  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}