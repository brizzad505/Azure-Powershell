# Increase OS drive on Azure Classic VM

# Authenticate to Azure Account 
Add-AzureAccount 
# Select Azure Subscription 
$subscription = (Get-AzureSubscription).SubscriptionName | Out-GridView -Title "Select Azure Subscription" -PassThru 
Select-AzureSubscription -SubscriptionName $subscription -Current 
# Select Azure Storage Account 
$storageAccount = Get-AzureStorageAccount | Select Label,Location | Out-GridView -Title "Select Azure Storage Account" -PassThru 
Set-AzureSubscription -SubscriptionName $subscription -CurrentStorageAccountName $storageAccount 
# Select Azure VM 
$vm = Get-AzureVM | Select ServiceName | Out-GridView -Title "Select a VM Service Name ..." -PassThru 
$vmname = $vm.ServiceName 
# Select Data Disk to resize 
$disk = Get-AzureVM -ServiceName $vmname -Name $vmname | Get-AzureOSDisk | Out-GridView -Title "Select a data disk to resize" -PassThru 
$diskName = $disk.DiskName 
# Stop and Deallocate VM prior to resizing data disk 
Stop-AzureVM -ServiceName $vmname -Name $vmname -Force 
# Specify new Data Disk size – must be larger than current size 
do {$size = Read-Host -Prompt "New size in GB"} until ( $size -gt $disk.LogicalDiskSizeInGB ) 
# Resize Data Disk to Larger Size 
Update-AzureDisk -Label "$diskName" -DiskName "$diskName" -ResizedSizeInGB $size 
# Start VM 
Start-AzureVM -ServiceName $vmname -Name $vmname