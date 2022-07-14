# pfe-gitops-terraform-infra

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.22.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.9.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.6.0 |
| <a name="requirement_http"></a> [http](#requirement\_http) | 2.2.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.11.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.22.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.9.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.2.3 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.3.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_group.aks_administrators](https://registry.terraform.io/providers/hashicorp/azuread/2.22.0/docs/resources/group) | resource |
| [azurerm_kubernetes_cluster.aks_cluster](https://registry.terraform.io/providers/hashicorp/azurerm/3.9.0/docs/resources/kubernetes_cluster) | resource |
| [azurerm_management_lock.rg-lock](https://registry.terraform.io/providers/hashicorp/azurerm/3.9.0/docs/resources/management_lock) | resource |
| [azurerm_resource_group.aks_rg](https://registry.terraform.io/providers/hashicorp/azurerm/3.9.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.aks-default](https://registry.terraform.io/providers/hashicorp/azurerm/3.9.0/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.nsg-subnet-association](https://registry.terraform.io/providers/hashicorp/azurerm/3.9.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.aksvnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.9.0/docs/resources/virtual_network) | resource |
| [local_file.kubeconfig](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [random_string.myrandom](https://registry.terraform.io/providers/hashicorp/random/3.3.1/docs/resources/string) | resource |
| [azuread_service_principal.k8s-sp](https://registry.terraform.io/providers/hashicorp/azuread/2.22.0/docs/data-sources/service_principal) | data source |
| [azurerm_kubernetes_service_versions.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.9.0/docs/data-sources/kubernetes_service_versions) | data source |
| [azurerm_log_analytics_workspace.log-analytics-workspace](https://registry.terraform.io/providers/hashicorp/azurerm/3.9.0/docs/data-sources/log_analytics_workspace) | data source |
| [azurerm_network_security_group.aks-nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.9.0/docs/data-sources/network_security_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | Azure Service Principal client ID | `string` | `"7f322fe4-a924-4e18-a61e-dfb47b566efa"` | no |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | Azure Service Principal client secret | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | This variable defines the Environment | `string` | `"dev"` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure Region where all these resources will be provisioned | `string` | `"East US"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | This variable defines the Resource Group | `string` | `"pfe-gitops"` | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | This variable defines the SSH Public Key for Linux k8s Worker nodes | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Azure account subscription ID | `string` | `"53b8ff38-9c35-473b-9fc9-9562f9da43db"` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | Azure Service Principal tenant ID | `string` | `"470498c0-975f-4d24-9391-3e4be3c30fd2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aks_cluster_apiserver_fqdn"></a> [aks\_cluster\_apiserver\_fqdn](#output\_aks\_cluster\_apiserver\_fqdn) | n/a |
| <a name="output_aks_cluster_id"></a> [aks\_cluster\_id](#output\_aks\_cluster\_id) | n/a |
| <a name="output_aks_cluster_kubeconfig"></a> [aks\_cluster\_kubeconfig](#output\_aks\_cluster\_kubeconfig) | n/a |
| <a name="output_aks_cluster_kubernetes_version"></a> [aks\_cluster\_kubernetes\_version](#output\_aks\_cluster\_kubernetes\_version) | n/a |
| <a name="output_aks_cluster_name"></a> [aks\_cluster\_name](#output\_aks\_cluster\_name) | n/a |
| <a name="output_azure_ad_group_id"></a> [azure\_ad\_group\_id](#output\_azure\_ad\_group\_id) | Azure AD Group Object Id |
| <a name="output_azure_ad_group_objectid"></a> [azure\_ad\_group\_objectid](#output\_azure\_ad\_group\_objectid) | n/a |
| <a name="output_latest_version"></a> [latest\_version](#output\_latest\_version) | n/a |
| <a name="output_location"></a> [location](#output\_location) | Resource Group Outputs |
| <a name="output_resource_group_id"></a> [resource\_group\_id](#output\_resource\_group\_id) | n/a |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | n/a |
| <a name="output_versions"></a> [versions](#output\_versions) | Azure AKS Versions Datasource |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
