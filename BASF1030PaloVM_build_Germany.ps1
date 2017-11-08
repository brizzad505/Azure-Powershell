
Login-AzureRmAccount -EnvironmentName AzureGermanCloud
Set-AzureRmContext -SubscriptionId "58897c77-c959-43a0-923f-f3c3b71c08fd"




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
New-AzureRmVM -ResourceGroupName $rgname -Location $locName -VM $newvm -Debug -ErrorAction Inquire
