provider "google-beta" {
  region  = var.region
  zone    = var.zone
  credentials = file("/tmp/key.json")
  project = "ai-lab-201911"
}

module "control_center" {
  source = "./modules/control_center"
  project = var.project
  zone   = var.zone
}

module "kafka_broker" {
  source = "./modules/kafka_broker"
  zone   = var.zone
  project = var.project
}

module "kafka_connect" {
  source = "./modules/kafka_connect"
  zone   = var.zone
  project = var.project
}

module "kafka_rest" {
  source = "./modules/kafka_rest"
  zone   = var.zone
  project = var.project
}

module "ksql" {
  source = "./modules/ksql"
  zone   = var.zone
  project = var.project
}

module "schema_registry" {
  source = "./modules/schema_registry"
  zone   = var.zone
  project = var.project
}

module "zookeeper" {
  source = "./modules/zookeeper"
  zone   = var.zone
  project = var.project
}
