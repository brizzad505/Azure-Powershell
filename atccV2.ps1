Select-AzureRmSubscription -SubscriptionName "Concerto-ATCC"



$RGStorage = "ATCC1954-STRG"
$RGNetwork = "ATCC1954-NWRG"
$RGInstance = "ATCC1954-VMRG"
$Location = "eastus"

New-AzureRmResourceGroup -Name $RGStorage -Location $Location
New-AzureRmResourceGroup -Name $RGNetwork -Location $Location
New-AzureRmResourceGroup -Name $RGInstance -Location $Location