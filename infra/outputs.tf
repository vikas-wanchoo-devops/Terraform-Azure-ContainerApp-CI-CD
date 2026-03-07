output "container_app_url" {
  value = azurerm_container_app.flaskapi.latest_revision_fqdn
}
