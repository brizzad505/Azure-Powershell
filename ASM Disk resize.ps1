
##This Gets Data disk info w. variables
$AzureVM = "ATCC-BLD-1"
$AzureService = "atcc-bld-16290"
Get-AzureVM -ServiceName $AzureService -Name “$AzureVM” | Get-AzureDataDisk

##This Updates the disk size w. variable. 
$DisknameBLD = "ATCC-BLD-16290-ATCC-BLD-1-0-201702151921060172"
Update-AzureDisk -DiskName $DisknameBLD -Label ResizeDataDisk -ResizedSizeInGB 450