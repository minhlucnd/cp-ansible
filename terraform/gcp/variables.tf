variable "region" {
  description = "Region"
  default     = "asia-southeast1"
}

variable "env" {
  description = "Environment prefix"
  default     = "dev"
}

variable "project" {
  description = "Name of project on GCP"
  default     = "ai-lab-201911"
}

variable "zone" {
  description = "Zone"
  default     = "asia-southeast1-a"
}
variable "broker_node_count" {
  description = "broker node count"
  default     = 3
}

variable "connect_node_count" {
  description = "connect node count"
  default     = 3
}

