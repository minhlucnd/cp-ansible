
resource "google_compute_instance" "zookeeper" {
  name         = "zookeeper"
  machine_type = "n1-standard-2"
  project = var.project
  zone = var.zone
 
  tags = ["confluent"]
labels = {
      "stack":"confluent",
      "ansible_group":"zookeeper"
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