resource "google_container_cluster" "primary" {
  name       = var.cluster_name
  location   = "asia-northeast3-a"
  network    = var.network
  subnetwork = var.subnetwork

  network_policy {
    enabled = var.network_policy
  }

  node_pool {
    name               = "default-node-pool"
    initial_node_count = 1

    autoscaling {
      min_node_count = 1
      max_node_count = 10
    }

    upgrade_settings {
      max_surge       = 1
      max_unavailable = 0
    }

    management {
      auto_repair  = true
      auto_upgrade = true
    }

    dynamic "node_config" {
      for_each = var.node_pools
      content {
        machine_type    = node_config.value.machine_type
        disk_size_gb    = node_config.value.disk_size_gb
        disk_type       = node_config.value.disk_type
        image_type      = node_config.value.image_type
        service_account = node_config.value.service_account
        tags            = ["gke-node"]
      }
    }
  }

  cluster_autoscaling {
    enabled = true

    auto_provisioning_defaults {
      oauth_scopes = [
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring",
        # ... 기타 필요한 스코프 ...
      ]
      service_account = var.node_pools[0].service_account

    }

    resource_limits {
      resource_type = "cpu"
      minimum       = 1
      maximum       = 100
    }

    resource_limits {
      resource_type = "memory"
      minimum       = 1024
      maximum       = 102400
    }
  }

  ip_allocation_policy {}

  remove_default_node_pool = false
}
