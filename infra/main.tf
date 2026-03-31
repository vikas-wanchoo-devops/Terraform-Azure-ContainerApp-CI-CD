locals {
  location = var.preferred_locations[0]
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = local.location
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = local.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_container_app_environment" "env" {
  name                = var.env_name
  location            = local.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_container_app" "flaskapi" {
  name                         = var.app_name
  resource_group_name          = azurerm_resource_group.rg.name
  container_app_environment_id = azurerm_container_app_environment.env.id

  revision_mode = "Single"

  identity {
    type = "SystemAssigned"
  }

  # Use ACR admin credentials securely via secrets
  registry {
    server               = azurerm_container_registry.acr.login_server
    username             = azurerm_container_registry.acr.admin_username
    password_secret_name = "acr-password"
  }

  secret {
    name  = "acr-password"
    value = azurerm_container_registry.acr.admin_password
  }

  template {
    container {
      name   = "flaskapi"
      image  = "${azurerm_container_registry.acr.login_server}/flask-api:latest"
      cpu    = 0.5
      memory = "1Gi"
    }
  }

  ingress {
    external_enabled = true
    target_port      = 5000

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }
}

# Assign AcrPull role so Container App can pull images from ACR (optional for RBAC-only mode later.)
resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = azurerm_container_app.flaskapi.identity[0].principal_id
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.acr.id

  depends_on = [
    azurerm_container_app.flaskapi
  ]
}
