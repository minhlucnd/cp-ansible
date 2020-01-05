provider "google-beta" {
  region      = var.region
  zone        = var.zone
  credentials = file("/tmp/key.json")
  project     = "ai-lab-201911"
}

module "firewall_confluent" {
  source  = "./modules/firewall_confluent"
  name    = "network-confluent"
  project = var.project
}

module "control_center" {
  source  = "./modules/control_center"
  project = var.project
  zone    = var.zone
  network = module.firewall_confluent.network_name
}

module "kafka_broker" {
  source  = "./modules/kafka_broker"
  zone    = var.zone
  project = var.project
  network = module.firewall_confluent.network_name
  node_count = var.broker_node_count
}

module "kafka_connect" {
  source  = "./modules/kafka_connect"
  zone    = var.zone
  project = var.project
  network = module.firewall_confluent.network_name
  node_count = var.connect_node_count
}

module "kafka_rest" {
  source  = "./modules/kafka_rest"
  zone    = var.zone
  project = var.project
  network = module.firewall_confluent.network_name
}

module "ksql" {
  source  = "./modules/ksql"
  zone    = var.zone
  project = var.project
  network = module.firewall_confluent.network_name

}

module "schema_registry" {
  source  = "./modules/schema_registry"
  zone    = var.zone
  project = var.project
  network = module.firewall_confluent.network_name

}

module "zookeeper" {
  source  = "./modules/zookeeper"
  zone    = var.zone
  project = var.project
  network = module.firewall_confluent.network_name
  node_count = var.broker_node_count

}
