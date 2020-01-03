output "external_ip" {
  value = "${google_compute_instance.zookeeper.network_interface.0.access_config.0.nat_ip}"
}
