
resource "google_compute_instance" "kafka_broker" {
  name         = "kafka-broker"
  machine_type = "n1-standard-2"
  project = var.project
  zone = var.zone
 
  tags = ["confluent"]
  labels = {
    "stack":"confluent",
    "ansible_group":"kafka_broker"
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