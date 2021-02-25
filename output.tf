output "app_service_name" {
  description = "Name of the App Service that was generated."
  value = azurerm_app_service.as.name
}
