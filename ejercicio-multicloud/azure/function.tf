# Crea la función de Azure
resource "azurerm_function_app" "ejemplo" {
  name                      = "ejemplo-function-nuevo"
  location                  = azurerm_resource_group.rg.location
  resource_group_name       = azurerm_resource_group.rg.name
  app_service_plan_id       = azurerm_app_service_plan.ejemplo.id
  storage_account_name      = azurerm_storage_account.ejemplo.name
  storage_account_access_key = azurerm_storage_account.ejemplo.primary_access_key

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "dotnet"
  }

  site_config {
    cors {
      allowed_origins = ["*"]
    }
  }
}

# Crea un plan de servicio de Azure
resource "azurerm_app_service_plan" "ejemplo" {
  name                = "<-service-plan-nuevo"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "FunctionApp"

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

# Crea una cuenta de almacenamiento de Azure
resource "azurerm_storage_account" "ejemplo" {
  name                     = "ejemplostorageml20242"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}