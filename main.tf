
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
