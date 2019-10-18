output "public_domain_name" {
  value = "${azurerm_app_service.espcas1.default_site_hostname}"
}
