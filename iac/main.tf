data "azurerm_resource_group" "rg_alimeul_k8s" {
  name = "rg-ALimeul2024_cours-projet"
}
resource "azurerm_kubernetes_cluster" "k8s" { 
  location            = data.azurerm_resource_group.rg_alimeul_k8s.location
  resource_group_name = data.azurerm_resource_group.rg_alimeul_k8s.name
  name                = "cluster-al"
  dns_prefix          = "k8s-al-noeud"   # préfixe des noms des nœuds créés
  identity {
    type = "SystemAssigned"              # ou "UserAssigned"
  }
  default_node_pool {
    name       = "worker"
    vm_size    = "Standard_B2S"        # 2 CPUs 4 GiO (ancienne désignation : Standard_D2_v2 pour 2 CPUs 7 GiO)
    node_count = var.node_count          # facultatif (3 par défaut)
  }
  network_profile {
    network_plugin = "kubenet"           # valeurs possibles : azure, kubenet ou none
    network_policy = "calico"            # none par défaut ; requis pour que les NetworkPolicies de Kubernetes aient un effet
  }
  tags = {
    cours     = "cours-projet",
    promotion = "HASDO_001",
    user = "ALimeul2024"
  }
}
