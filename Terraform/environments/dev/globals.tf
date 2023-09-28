provider "google" {
  credentials = file("../../../moa-meetingplatform-0c9f005c745b.json")
  project     = "moa-meetingplatform"
  region      = "asia-northeast3"
}

# GCP 프로젝트 ID
variable "gcp_project_id" {
  description = "The ID of the GCP project"
  type        = string
  default     = "moa-meetingplatform"
}

# GCP 기본 리전
variable "gcp_default_region" {
  description = "The default region for GCP resources"
  type        = string
  default     = "asia-northeast3"
}

# GCP 기본 존
variable "gcp_default_zones" {
  description = "The default GCP zones within the region"
  type        = list(string)
  default     = ["asia-northeast3-a", "asia-northeast3-b", "asia-northeast3-c"]
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
  default = [
    {
      name               = "default-node-pool"
      machine_type       = "e2-medium"
      node_locations     = "asia-northeast3-b,asia-northeast3-c"
      min_count          = 1
      max_count          = 100
      local_ssd_count    = 0
      spot               = false
      disk_size_gb       = 100
      disk_type          = "pd-standard"
      image_type         = "COS_CONTAINERD"
      enable_gcfs        = false
      enable_gvnic       = false
      logging_variant    = "DEFAULT"
      auto_repair        = true
      auto_upgrade       = true
      service_account    = "project-service-account@moa-meetingplatform.iam.gserviceaccount.com"
      preemptible        = false
      initial_node_count = 3
    }
  ]
}
