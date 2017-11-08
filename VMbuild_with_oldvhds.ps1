
#Log into Azure account: 

Add-AzureRmAccount -TenantId c1e13085-249f-48b8-b354-fa698cee5b4f -SubscriptionId 6CEDFFF3-A5D4-4D2F-9F1D-2605168B507E

#Get Network Card Info. Record Network Interface IDs
(Get-AzureRMVM -ResourceGroupName ASHUSEAST-RG -Name ASHEASTUS-WIN12).NetworkInterfaceIDs

#copy std to prm
.\AzCopy.exe /Source:"https://niss1762std.blob.core.windows.net/vhds" /Dest:"https://niss1762prodprem.blob.core.windows.net/vhds" /SourceKey:K9tyZyk/vLGIpq4KI5Quk4rR5vnnU3ebXC9e7U1nZ4ioNaNupgObDCgPbCmekgx5CINqsiKAs76DIraFe0BYIA== /DestKey:RJmxUr3wIftd2iFwIO57yN9gLhmmcjXXIcndtnotUGIqXv4OHn+CUaHDqgiB0iXBYUqAqHu93IY482vXmTvGnw==  /Pattern:NISS1762-APP05T201661415270.vhd



## Environment - same region and resource group as old VM
 
$LocationName = "eastus"
$ResourceGroupName = "ATCC1972-VMRG"
 
 
## VM - reusing the old VM details
 
$ComputerName = "ATCC1972-SQL01"
$VMName = "ATCC1972-SQL01T"
 
 
## OS Disk - using the old disk
 
$OSDiskName = "NISS1762-APP05T"
$OSDiskUri = "https://niss1762prodprem.blob.core.windows.net/vhds/NISS1762-APP05T201661415270.vhd" 
$VMSize = "Standard_DS12_v2"
 
 
## DataDisk - using the old disk
$DataDiskName = "NISS1762-APP05T-SSDNEW.vhd"
$DataDiskUri = "https://niss1762prodprem.blob.core.windows.net/vhds/NISS1762-APP05T-SSDNEW.vhd"
 
 
## Networking - reuse the old machine's network connection
$NICObjectName = "niss1762-app05t"
$NIC = Get-AzureRmNetworkInterface -ResourceGroupName $ResourceGroupName -Name $NICObjectName
 
 
## Build up the VM configuration using the existing disks
 
$VirtualMachine = New-AzureRmVMConfig -VMName $VMName -VMSize $VMSize
$VirtualMachine = Add-AzureRmVMNetworkInterface -VM $VirtualMachine -Id $NIC.Id
$VirtualMachine = Set-AzureRmVMOSDisk -VM $VirtualMachine -VhdUri $OSDiskUri -name $OSDiskName -CreateOption attach -Windows -Caching "ReadWrite"
$VirtualMachine = Add-AzureRmVMDataDisk -VM $VirtualMachine -Name "$DataDiskName" -VhdUri $DataDiskUri -Lun 0 -CreateOption attach -DiskSizeInGB $null -Caching "Readwrite"
 
 
## Deploy the new VM from the configuration
 
# You can comment out the next line to test the above without creating a machine, saving loads of time.
 
New-AzureRmVM -ResourceGroupName $ResourceGroupName -Location $LocationName -VM $VirtualMachine -Verbose


