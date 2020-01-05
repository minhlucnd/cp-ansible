
resource "google_compute_instance" "zookeeper" {
  name         = "zookeeper-${count.index}"
  machine_type = "n1-standard-1"
  project      = var.project
  zone         = var.zone
  count        = var.node_count
  tags         = ["confluent"]
  labels = {
    "stack" : "confluent",
    "ansible_group" : "zookeeper"
  }
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }


  network_interface {
    network = var.network

    access_config {
      // Ephemeral IP
    }
  }
}
