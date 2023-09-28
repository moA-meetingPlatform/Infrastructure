resource "google_container_cluster" "primary" {
  name       = var.cluster_name
  location   = var.location
  network    = var.network
  subnetwork = var.subnetwork

  network_policy {
    enabled = var.network_policy
  }

  node_pool {
    dynamic "node_config" {
      for_each = var.node_pools
      content {
        machine_type    = node_config.value["machine_type"]
        disk_size_gb    = node_config.value["disk_size_gb"]
        disk_type       = node_config.value["disk_type"]
        image_type      = node_config.value["image_type"]
        service_account = node_config.value["service_account"]

        tags = ["gke-node"]



      }
    }
    name               = "default-node-pool"
    initial_node_count = 1
  }

  ip_allocation_policy {

  }

  remove_default_node_pool = false
}
