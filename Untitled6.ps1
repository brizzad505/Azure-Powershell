## Environment - same region and resource group as old VM
 
$LocationName = "US East"
 
$ResourceGroupName = "NISS1762-RG1"
 
 
## VM - reusing the old VM details
 
$ComputerName = "NISS1762-APP05T"
 
$VMName = "NISS1762-APP05T"
 
 
## OS Disk - using the old disk
 
$OSDiskName = "NISS1762-APP05T"
 
$OSDiskUri = "https://niss1762prodprem.blob.core.windows.net/vhds/NISS1762-APP05T201661415270.vhd"
 
$VMSize = "Standard DS12 v2"
 
 
## DataDisk - using the new disk
 
$DataDiskUri = "https://niss1762prodprem.blob.core.windows.net/vhds/NISS1762-APP05T-SSDNEW.vhd"
 
 
## Networking - reuse the old machine's network connection
 
$NICObjectName = "niss1762-app05t3"
$NIC = Get-AzureRmNetworkInterface -ResourceGroupName NISS1762-RG1 -Name $NICObjectName
 
 
## Build up the VM configuration using the existing disks
 
$VirtualMachine = New-AzureRmVMConfig -VMName $VMName -VMSize $VMSize
 
$VirtualMachine = Add-AzureRmVMNetworkInterface -VM $VirtualMachine -Id $NIC.Id
 
$VirtualMachine = Set-AzureRmVMOSDisk -VM $VirtualMachine -VhdUri $OSDiskUri -name $OSDiskName -CreateOption attach -Windows -Caching "ReadWrite"
 
$VirtualMachine = Add-AzureRmVMDataDisk -VM $VirtualMachine -Name "NISS1762-APP05T-SSDNEW.vhd" -VhdUri $DataDiskUri -Lun 0 -CreateOption attach -DiskSizeInGB $null -Caching "Read/write"
 
 
## Deploy the new VM from the configuration
 
# You can comment out the next line to test the above without creating a machine, saving loads of time.
 
New-AzureRmVM -ResourceGroupName $ResourceGroupName -Location $LocationName -VM $VirtualMachine -Verbose