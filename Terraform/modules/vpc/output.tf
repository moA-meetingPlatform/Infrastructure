# 생성된 VPC의 self_link를 출력합니다.
output "vpc_self_link" {
  description = "The self link of the created VPC"
  value       = google_compute_network.vpc.self_link
}

# 생성된 서브넷의 self_link를 출력합니다.
output "subnet_self_link" {
  description = "The self link of the created subnet"
  value       = google_compute_subnetwork.gke_subnet.self_link
}
output "name" {
  description = "The name of the VPC"
  value       = google_compute_network.vpc.name
}

output "subnet_name" {
  description = "The name of the subnet"
  value       = google_compute_subnetwork.gke_subnet.name
}
output "vpc_name" {
  description = "The name of the VPC"
  value       = google_compute_network.vpc.name
}
