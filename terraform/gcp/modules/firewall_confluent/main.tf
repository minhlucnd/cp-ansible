resource "google_compute_firewall" "firewall_confluent" {
  name    = "firewall-confluent"
  project = var.project
  network = google_compute_network.network_confluent.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22","9091", "9092","9021","8083","8088","8082","8081","2181","2888","3888"]
  }

  source_tags = ["confluent"]
  source_ranges = ["0.0.0.0/0"]

}

resource "google_compute_network" "network_confluent" {
  name = var.name
  project = var.project
}