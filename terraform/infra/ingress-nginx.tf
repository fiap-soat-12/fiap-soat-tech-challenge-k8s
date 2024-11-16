resource "kubernetes_namespace" "ingress_nginx_namespaces" {
  metadata {
    name = "ingress-nginx"
  }
}

resource "helm_release" "nginx_ingress" {
  name       = "ingress-nginx"
  namespace  = "ingress-nginx"
  chart      = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  version    = "4.11.2"

  values = [file("${path.module}/charts/ingress-nginx/values.yaml")]

  timeout = 600

  depends_on = [
    kubernetes_namespace.ingress_nginx_namespaces,
    helm_release.metrics_server,
    helm_release.grafana,
    helm_release.kube-prometheus-stack
  ]
}