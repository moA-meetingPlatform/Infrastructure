# VPC를 생성합니다.
# auto_create_subnetworks는 자동으로 서브넷을 생성하지 않도록 false로 설정합니다.
resource "google_compute_network" "vpc" {
  name                    = "gke-vpc"
  auto_create_subnetworks = false
  description             = "VPC for GKE Cluster"
}

# 위에서 생성한 VPC 내에 서브넷을 생성합니다.
# CIDR 범위는 "10.0.0.0/16"으로 설정하였습니다.
resource "google_compute_subnetwork" "gke_subnet" {
  name          = "gke-subnet"
  ip_cidr_range = "10.0.0.0/16"
  region        = var.gcp_default_region
  network       = google_compute_network.vpc.name
}

# GKE 클러스터가 올바르게 작동하기 위한 Firewall 규칙을 설정합니다.
# 모든 트래픽 (ICMP, TCP, UDP)를 허용하도록 설정하였습니다.
resource "google_compute_firewall" "gke_allow_all" {
  name    = "gke-allow-all"
  network = google_compute_network.vpc.name

  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  source_ranges = ["0.0.0.0/0"]
}
