
variable "project" {
  description = "Name of project on GCP"
  default     = "ai-lab-201911"
}

variable "zone" {
    description = "Zone"
    default = "asia-southeast1-a"
}
              
variable "network" {
  description = "network"
  default = "default"
}

variable "node_count" {
  description = "count"
  default = 3
}
