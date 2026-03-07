resource "azurerm_resource_group" "rg" {
  name     = "WanchooResourceGroup1"
  location = "East US"
}

resource "azurerm_container_registry" "acr" {
  name                = "vikasacr1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_container_app_environment" "env" {
  name                = "vikas-env1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_container_app" "flaskapi" {
  name                         = "flaskapi-app1"
  resource_group_name          = azurerm_resource_group.rg.name
  container_app_environment_id = azurerm_container_app_environment.env.id

  revision_mode = "Single"   # ✅ required

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

    traffic_weight {   # ✅ correct schema
      latest_revision = true
      percentage      = 100
    }
  }
}

# Optional: output the app's FQDN so you can test it easily
output "flaskapi_url" {
  value = azurerm_container_app.flaskapi.latest_revision_fqdn
}
