resource "kubernetes_namespace" "devsecops" {
  metadata {
    name = "devsecops"
  }
}
resource "kubernetes_service_account" "vulnerable_springboot" {
  metadata {
    name      = "vulnerable-springboot"
    namespace = kubernetes_namespace.devsecops.metadata[0].name
  }

  automount_service_account_token = false
}
