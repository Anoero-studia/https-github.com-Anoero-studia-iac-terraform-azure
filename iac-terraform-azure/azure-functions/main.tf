resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "example" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_function_app" "example" {
  name                = var.function_app_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  service_plan_id     = azurerm_service_plan.example.id
  
  app_settings = {
  "FUNCTIONS_WORKER_RUNTIME" = "dotnet-isolated"
  }
  
  site_config {
  always_on            = true
  ftps_state           = "Disabled"
  http2_enabled        = true
  }
}

resource "azurerm_function_app_function" "example" {
  name               = var.function_name
  function_app_id    = azurerm_linux_function_app.example.id
  filename           = "${path.module}/hello.zip"
  language           = "dotnet-isolated"
  entry_point        = "HelloWorld.Functions.Hello"
}
