provider "azurerm" {
  version = "~>2.0"
  features {}
}

resource "azurerm_resource_group" "testrg" {
  name     = "test-rg"
  location = "eastus"
}

resource "azurerm_app_service_plan" "appserviceplan466" {
  name                = "testASP466"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.testrg.name

  sku {
    tier = "Premiumv2"
    size = "P1v2"
  }
}

resource "azurerm_app_service" "testwebapp466" {
  name                = "testwebapp466"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.testrg.name
  app_service_plan_id =  azurerm_app_service_plan.appserviceplan466.id
}