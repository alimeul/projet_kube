variable "resource_group_location" {
  default     = "francecentral"   # az account list-locations | jq '[ .[] | select(.name | startswith("france")).name ] | sort'
  description = "Localisation géographique du groupe de ressources"
}
variable "node_count" {
  default     = 3   # compter environ 10 minutes pour créer le cluster
  description = "Quantité initiale de nœuds pour la réserve (pool)"
}
