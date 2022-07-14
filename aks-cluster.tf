resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                 = "${azurerm_resource_group.aks_rg.name}-cluster"
  location             = azurerm_resource_group.aks_rg.location
  resource_group_name  = azurerm_resource_group.aks_rg.name
  dns_prefix           = "${azurerm_resource_group.aks_rg.name}-cluster"
  kubernetes_version   = data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group  = "${azurerm_resource_group.aks_rg.name}-nrg"
  azure_policy_enabled = true

  default_node_pool {
    name                 = "systempool"
    vm_size              = "Standard_B2s"
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    zones                = []
    enable_auto_scaling  = true
    max_count            = 3
    min_count            = 2
    os_disk_size_gb      = 30
    type                 = "VirtualMachineScaleSets"
    vnet_subnet_id       = azurerm_subnet.aks-default.id
    node_labels = {
      "nodepool-type" = "system"
      "environment"   = "dev"
      "nodepoolos"    = "linux"
      "app"           = "system-apps"
    }
    tags = {
      "nodepool-type" = "system"
      "environment"   = "dev"
      "nodepoolos"    = "linux"
      "app"           = "system-apps"
    }
  }


  # Identity (System Assigned or Service Principal)
  identity {
    type = "SystemAssigned"
  }

  # RBAC and Azure AD Integration Block
  role_based_access_control_enabled = true
  azure_active_directory_role_based_access_control {
    managed                = true
    admin_group_object_ids = [azuread_group.aks_administrators.id]
    azure_rbac_enabled     = true
  }

  oms_agent {
    log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log-analytics-workspace.id
  }

  enable_pod_security_policy = true
  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }
  microsoft_defender {
    log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log-analytics-workspace.id
  }

  # Linux Profile
  linux_profile {
    admin_username = "touzria"
    ssh_key {
      key_data = var.ssh_public_key
    }
  }

  # Network Profile
  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }

  tags = {
    Environment = var.environment
  }
}

data "azurerm_log_analytics_workspace" "log-analytics-workspace" {
  name                = "aks-logs-analytics-workspace"
  resource_group_name = "pfe-gitops"
}