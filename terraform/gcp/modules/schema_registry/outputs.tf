output "external_ip" {
  value = "${google_compute_instance.schema_registry.network_interface.0.access_config.0.nat_ip}"
}
