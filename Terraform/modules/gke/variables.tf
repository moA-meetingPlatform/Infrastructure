variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "location" {
  description = "The location (region or zone) of the GKE cluster"
  type        = string
}

variable "network" {
  description = "The VPC network to be used by the GKE cluster"
  type        = string
}

variable "subnetwork" {
  description = "The subnetwork to be used by the GKE cluster"
  type        = string
}

variable "node_pools" {
  description = "List of maps containing node pools information"
  type = list(object({
    name               = string
    machine_type       = string
    node_locations     = string
    min_count          = number
    max_count          = number
    local_ssd_count    = number
    spot               = bool
    disk_size_gb       = number
    disk_type          = string
    image_type         = string
    enable_gcfs        = bool
    enable_gvnic       = bool
    logging_variant    = string
    auto_repair        = bool
    auto_upgrade       = bool
    service_account    = string
    preemptible        = bool
    initial_node_count = number
  }))
}

variable "ip_range_pods" {
  description = "The range of IPs for pods in GKE"
  type        = string
  default     = "10.0.128.0/18"
}

variable "ip_range_services" {
  description = "The range of IPs for services in GKE"
  type        = string
  default     = "10.0.192.0/18"
}

variable "network_policy" {
  description = "Enable network policy on the GKE cluster"
  type        = bool
  default     = true
}
