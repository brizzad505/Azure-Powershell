Login-AzureRmAccount
Get-AzureRMSubscription
Register-AzureRmResourceProvider -ProviderNamespace Microsoft.ClassicInfrastructureMigrate
    Get-AzureRmResourceProvider -ProviderNamespace Microsoft.ClassicInfrastructureMigrate

$vnetname = migrationtest


$storageAccountName = "w1portalvhdssrlvw34m719t"
Move-AzureStorageAccount -Validate -StorageAccountName $storageAccountName -verbose