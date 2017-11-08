##Recreate ATC1972-EP03 abd EP04###

Add-AzureRmAccount
Select-AzureRmSubscription -SubscriptionName "Concerto-ATCC"


#############################################________________________________________________________________________________________________________________________________________________________________________________________________________________

#Provide the subscription Id
$subscriptionId = 'e807d8c8-3296-4006-82e7-f0700e8438c7'

#Provide the name of your resource group
$resourceGroupName ='ATCC1972-VMRG'

#Provide the name of the snapshot that will be used to create OS disk
#$snapshotName = 'ATCC1972-EP01-OsDisk'
#$snapshotName = 'ATCC1972-EP02-OsDisk'
$snapshotName = 'ATCC1972-EP03-OsDisk'

#Provide the name of the OS disk that will be created using the snapshot##
#$osDiskName = 'ATCC1972-EP01-OsDisk_11072017'
#$osDiskName = 'ATCC1972-EP02-OsDisk_11072017'
$osDiskName = 'ATCC1972-EP03-OsDisk_11072017'

#Provide the name of an existing virtual network where virtual machine will be created
$virtualNetworkName = 'ATCC1972-VN1'

#Provide the name of the virtual machine
#$virtualMachineName = 'ATCC1972-EP01'
#$virtualMachineName = 'ATCC1972-EP02'
$virtualMachineName = 'ATCC1972-EP03'

#Provide AVset name
$vmAvSetName = 'ATCC1972-EPAS'

#Get AVSet
$vmAvSet = Get-AzureRmAvailabilitySet -Name $vmAvSetName -ResourceGroupName $resourceGroupName

#Provide AVSet ID
$AVsetID = "/subscriptions/e807d8c8-3296-4006-82e7-f0700e8438c7/resourceGroups/ATCC1972-VMRG/providers/Microsoft.Compute/availabilitySets/ATCC1972-EPAS"

#Provide Location
$location = 'eastus'

#Chose storage type
$storageType = "PremiumLRS"



#Provide the size of the virtual machine
#e.g. Standard_DS3
#Get all the vm sizes in a region using below script:
#e.g. Get-AzureRmVMSize -Location eastus
$virtualMachineSize = 'Standard_D3_v2_Promo'

#Set the context to the subscription Id where Managed Disk will be created
Select-AzureRmSubscription -SubscriptionId $SubscriptionId

$snapshot = Get-AzureRmSnapshot -ResourceGroupName $resourceGroupName -SnapshotName $snapshotName 
$diskConfig = New-AzureRmDiskConfig -AccountType StandardLRS -Location $snapshot.Location  -SourceResourceId $snapshot.Id -CreateOption Copy
$disk = New-AzureRmDisk -Disk $diskConfig -ResourceGroupName $resourceGroupName -DiskName $osDiskName
##*****NOte:  The Accountype PremiumLRS threw errors with this VM Size even though teh size supports it.  I had to stand up using StandardLRS, then shut down VM in portal, resize to same VM size, then chnage to managed disk to premiumlrs. 

#Initialize virtual machine configuration
$VirtualMachine = New-AzureRmVMConfig -VMName $virtualMachineName -VMSize $virtualMachineSize -AvailabilitySetId $AVsetID

#Use the Managed Disk Resource Id to attach it to the virtual machine. Please change the OS type to linux if OS disk has linux OS
$VirtualMachine = Set-AzureRmVMOSDisk -VM $VirtualMachine -ManagedDiskId $disk.Id -CreateOption Attach -Windows

#Create a public IP for the VM  
#$publicIp = New-AzureRmPublicIpAddress -Name ($VirtualMachineName.ToLower()+'_ip') -ResourceGroupName $resourceGroupName -Location $snapshot.Location -AllocationMethod Dynamic

#Get the virtual network where virtual machine will be hosted
$vnet = Get-AzureRmVirtualNetwork -Name $virtualNetworkName -ResourceGroupName ATCC1972-NWRG

#Build AVSet
$vmAvSet = Get-AzureRmAvailabilitySet -Name $vmAvSetName -ResourceGroupName $resourceGroupName

# Create NIC in the first subnet of the virtual network 
#$NIC = Get-AzureRmNetworkInterface -Name ATCC1972-EP01-eth0 -ResourceGroupName ATCC1972-VMRG
#$NIC = Get-AzureRmNetworkInterface -Name ATCC1972-EP02-eth0 -ResourceGroupName ATCC1972-VMRG
$NIC = Get-AzureRmNetworkInterface -Name ATCC1972-EP03-eth0 -ResourceGroupName ATCC1972-VMRG

$VirtualMachine = Add-AzureRmVMNetworkInterface -VM $VirtualMachine -Id $nic.Id


#Create the virtual machine with Managed Disk
New-AzureRmVM -VM $VirtualMachine -ResourceGroupName $resourceGroupName -Location $snapshot.Location 

ATCC1972-EP01-eth0 
ATCC1972-EP02-eth0 
ATCC1972-EP03-eth0 