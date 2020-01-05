
resource "google_compute_instance" "schema_registry" {
  name         = "schema-registry"
  machine_type = "f1-micro"
  project = var.project
  zone = var.zone
 
  tags = ["confluent"]
labels = {
      "stack":"confluent",
      "ansible_group":"schema_registry"
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