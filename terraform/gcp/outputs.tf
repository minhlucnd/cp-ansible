output "control_center" {
  value = ["${module.control_center.external_ip}"]
}

output "firewall_confluent_name" {
  value = "${module.firewall_confluent.network_name}"
}
