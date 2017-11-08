## Environment - same region and resource group as old VM

$LocationName = "germanynortheast"
$ResourceGroupName = "BASF1030-VMRG"
 
## VM - reusing the old VM details
 
$ComputerName = "BASF1030-WEB02"
$VMName = "BASF1030-WEB02"
$VMSize = "Standard_DS2_v2"
 
 
## OS Disk - using the old disk
 
$OSDiskName = "BASF1030-WEB02"
$OSDiskUri = "https://basf1031stdstr.blob.core.cloudapi.de/vhds/BASF1030-WEB0220170307024751.vhd"

## DataDisk - using the old disk
$DataDiskName = "BASF1030-WEB02-DATA" 
$DataDiskUri = "https://basf1031stdstr.blob.core.cloudapi.de/vhds/BASF1030-WEB02-DATA.vhd"
 
 
## Networking - reuse the old machine's network connection
 
$NICObjectName = "basf1030-web02315"
$NIC = Get-AzureRmNetworkInterface -ResourceGroupName BASF1030-VMRG -Name $NICObjectName

$avName="BASF1030-WEBProd-AS"
$avSet =Get-AzureRmAvailabilitySet –Name $avName –ResourceGroupName $ResourceGroupName

Remove-AzureRmVM -ResourceGroupName $ResourceGroupName -Name $VMName
 
## Build up the VM configuration using the existing disks
 
$VirtualMachine = New-AzureRmVMConfig -VMName $VMName -VMSize $VMSize -AvailabilitySetId "/subscriptions/58897c77-c959-43a0-923f-f3c3b71c08fd/resourceGroups/BASF1030-VMRG/providers/Microsoft.Compute/availabilitySets/BASF1030-WEBProd-AS"
$VirtualMachine = Add-AzureRmVMNetworkInterface -VM $VirtualMachine -Id $NIC.Id
$VirtualMachine = Set-AzureRmVMOSDisk -VM $VirtualMachine -VhdUri $OSDiskUri -name $OSDiskName -CreateOption attach -Windows -Caching "ReadWrite"
 $VirtualMachine = Add-AzureRmVMDataDisk -VM $VirtualMachine -Name "$DataDiskName" -VhdUri $DataDiskUri -Lun 0 -CreateOption attach -DiskSizeInGB $null -Caching "Readwrite"
 
 
## Deploy the new VM from the configuration
 
# You can comment out the next line to test the above without creating a machine, saving loads of time.
 
New-AzureRmVM -ResourceGroupName $ResourceGroupName -Location $LocationName -VM $VirtualMachine -Verbose