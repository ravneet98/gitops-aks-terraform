# gitops.tf
resource "helm_release" "flux" {
  name       = "flux"
  repository = "https://fluxcd-community.github.io/helm-charts"
  chart      = "flux"
  namespace  = "flux-system"

  values = [
    {
      "gitRepository" = {
        url       = "https://github.com/ravneet98/gitops-aks-terraform"
        branch    = "main"
        secretRef = "flux-git-secret"
      }
      "syncInterval" = "1m"
    }
  ]
}

resource "kubernetes_secret" "flux_git_secret" {
  metadata {
    name      = "flux-git-secret"
    namespace = "flux-system"
  }
  data = {
    "username" = base64encode("ravneet98")
    "password" = base64encode("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")
  }
  type = "kubernetes.io/basic-auth"
}
