
Login-AzureRmAccount -EnvironmentName AzureGermanCloud
Set-AzureRmContext -SubscriptionId "58897c77-c959-43a0-923f-f3c3b71c08fd"

Get-AzureRmResourceGroup
    <#Results#>
    <#ResourceGroupName : BASF1030-NWRG
Location          : germanynortheast
ProvisioningState : Succeeded
Tags              : 
ResourceId        : /subscriptions/58897c77-c959-43a0-923f-f3c3b71c08fd/resourceGroups/BASF1030-NWRG

ResourceGroupName : BASF1030-STRG
Location          : germanynortheast
ProvisioningState : Succeeded
Tags              : 
ResourceId        : /subscriptions/58897c77-c959-43a0-923f-f3c3b71c08fd/resourceGroups/BASF1030-STRG

ResourceGroupName : BASF1030-VMRG
Location          : germanynortheast
ProvisioningState : Succeeded
Tags              : 
ResourceId        : /subscriptions/58897c77-c959-43a0-923f-f3c3b71c08fd/resourceGroups/BASF1030-VMRG

ResourceGroupName : DABRG
Location          : germanycentral
ProvisioningState : Succeeded
Tags              : 
ResourceId        : /subscriptions/58897c77-c959-43a0-923f-f3c3b71c08fd/resourceGroups/DABRG
#>

## Environment - same region and resource group as old VM
 
$LocationName = "germanynortheast"
$ResourceGroupName = "BASF1030-NWRG"
 
 
## VM - reusing the old VM details
 
$ComputerName = "basf1030palo"
$VMName = "basf1030palo"
 
 ## VM - Using new VM details
 
#####$ComputerName = "NISS1762-APP05T_New"
#####$VMName = "NISS1762-APP05T_New"
 
 
## OS Disk - using the old disk
 
$OSDiskName = "basf1030palo"
$OSDiskUri = "https://basf1031stdstr.blob.core.cloudapi.de/vhds/basf1030palo-vmseries1-byol.vhd" 
$VMSize = "Standard_D3"
 
 
## DataDisk - using the old disk
####$DataDiskName = "NISS1762-APP05T-SSDNEW.vhd"
####$DataDiskUri = "https://niss1762prodprem.blob.core.windows.net/vhds/NISS1762-APP05T-SSDNEW.vhd"
 
 
## Networking - reuse the old machine's network connection
$NICMgmt = "basf1030palo-eth0"
$NIC = Get-AzureRmNetworkInterface -ResourceGroupName $ResourceGroupName -Name $NICObjectName
 
 
## Build up the VM configuration using the existing disks
 
$VirtualMachine = New-AzureRmVMConfig -VMName $VMName -VMSize $VMSize
$VirtualMachine = Add-AzureRmVMNetworkInterface -VM $VirtualMachine -Id $NIC.Id
$VirtualMachine = Set-AzureRmVMOSDisk -VM $VirtualMachine -VhdUri $OSDiskUri -name $OSDiskName -CreateOption attach -Windows -Caching "ReadWrite"
$VirtualMachine = Add-AzureRmVMDataDisk -VM $VirtualMachine -Name "$DataDiskName" -VhdUri $DataDiskUri -Lun 0 -CreateOption attach -DiskSizeInGB $null -Caching "Readwrite"
 
 
## Deploy the new VM from the configuration
 
# You can comment out the next line to test the above without creating a machine, saving loads of time.
 
New-AzureRmVM -ResourceGroupName $ResourceGroupName -Location $LocationName -VM $VirtualMachine -Verbose


______________________________________________________________________________________________________________________

#Variables
$rgname = "WestEU2-fwRG"
$vmsize = "Standard_D3_v2"
$vmname = "basf1030palo"
$locName = "germanynortheast"
$nicName1 = "basf1030palo-eth0"
$nicName2 = "basf1030palo-eth1"
$nicName3 = "basf1030palo-eth2"
$vnetName = "fwVNET"
$SubName1 = "Mgmt"
$SubName2 = "Untrust"
$SubName3 = "Trust" 
$osDiskName = "osdisk"
$osDiskVhdUri = "https://basf1031stdstr.blob.core.cloudapi.de/vhds/basf1030palo-vmseries1-byol.vhd"
 
#New VM config
$newvm = New-AzureRmVMConfig -VMName $vmname -VMSize $vmsize
$newvm = Set-AzureRmVMPlan -VM $newvm -Publisher paloaltonetworks -Product vmseries1 -Name "byol"
 
#Get virtual network
$vnet=Get-AzureRmVirtualNetwork -Name $vnetName -ResourceGroupName $rgName
 
#Get subnet
$subnet1 = $vnet.Subnets | Where-Object { $_.Name -eq $SubName1}
$subnet2 = $vnet.Subnets | Where-Object { $_.Name -eq $SubName2}
$subnet3 = $vnet.Subnets | Where-Object { $_.Name -eq $SubName3}
 
#New Public IP
$publicip = New-AzureRmPublicIpAddress -Name $nicName1 -ResourceGroupName $rgName -Location $locName -AllocationMethod Dynamic
 
#New nic for VM
$nic1=New-AzureRmNetworkInterface -Name $nicName1 -ResourceGroupName $rgName -Location $locName -SubnetId $Subnet1.Id  -PublicIpAddressId $publicip.Id
$nic2=New-AzureRmNetworkInterface -Name $nicName2 -ResourceGroupName $rgName -Location $locName -SubnetId $Subnet2.Id
$nic3=New-AzureRmNetworkInterface -Name $nicName3 -ResourceGroupName $rgName -Location $locName -SubnetId $Subnet3.Id
 
#Update VM config
$newvm = Add-AzureRmVMNetworkInterface -VM $newvm -Id $nic1.Id -Primary
$newvm = Add-AzureRmVMNetworkInterface -VM $newvm -Id $nic2.Id
$newvm = Add-AzureRmVMNetworkInterface -VM $newvm -Id $nic3.Id
 
#Attach copied disk to VM (sample. just one OS disk)
$newvm = Set-AzureRmVMOSDisk -VM $newvm -VhdUri $osDiskVhdUri -name $osDiskName -CreateOption attach -Linux
 
#Create VM
New-AzureRmVM -ResourceGroupName $rgname -Location $locName -VM $newvm