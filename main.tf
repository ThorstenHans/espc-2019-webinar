
locals {
  default_tags = {
    author = "Thorsten Hans"
  }

  all_tags = "${merge(local.default_tags, var.custom_tags)}"
}

resource "azurerm_resource_group" "espcrg1" {
  name     = "espc-webinar-live"
  location = "westus"
  tags     = "${local.all_tags}"
}

resource "azurerm_app_service_plan" "espcasp1" {
  name                = "asp-espc-webinar-live"
  resource_group_name = "${azurerm_resource_group.espcrg1.name}"
  location            = "${azurerm_resource_group.espcrg1.location}"

  kind     = "Linux"
  reserved = true
  sku {
    tier = "Standard"
    size = "S1"
  }

  tags = "${local.all_tags}"
}

resource "azurerm_app_service" "espcas1" {
  name                = "as-espc-webinar-live"
  resource_group_name = "${azurerm_resource_group.espcrg1.name}"
  location            = "${azurerm_resource_group.espcrg1.location}"
  app_service_plan_id = "${azurerm_app_service_plan.espcasp1.id}"
  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on        = true
    linux_fx_version = "DOCKER|nginx:1.7.9"
  }


  tags = "${local.all_tags}"
}
