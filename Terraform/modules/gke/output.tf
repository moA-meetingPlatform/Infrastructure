output "cluster_endpoint" {
  description = "The IP address of this cluster's master endpoint"
  value       = google_container_cluster.primary.endpoint
}

output "client_certificate" {
  description = "Base64-encoded public certificate used by clients to authenticate to the cluster endpoint"
  value       = google_container_cluster.primary.master_auth[0].client_certificate
}

output "client_key" {
  description = "Base64-encoded private key used by clients to authenticate to the cluster endpoint"
  value       = google_container_cluster.primary.master_auth[0].client_key
}
