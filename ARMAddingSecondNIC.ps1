#Login to tenant ***Germany***


#Declare Variables
$VNET = Get-AzureRmVirtualNetwork -Name ‘BASF1030-VN1’ -ResourceGroupName ‘BASF1030-NWRG'
$SubnetID = (Get-AzureRmVirtualNetworkSubnetConfig -Name ‘BASFvn1-clustersub’ -VirtualNetwork $VNET).Id
$NICName = ‘basf-sql01clusternic’
$NICResourceGroup = ‘BASF1030-NWRG’
$Location = ‘Germany Northeast’
$IPAddress = ‘172.22.13.228’
$VMname = ‘BASF1030-SQL01’
$VMRG =  ‘BASF1030-VMRG'

#Get the VM
$VM = Get-AzureRmVM -Name $VMname -ResourceGroupName $VMRG

#Add the second NIC
$NewNIC =  Get-AzureRmNetworkInterface -Name $NICName -ResourceGroupName $NICResourceGroup
Add-AzureRmVMNetworkInterface -VM $VM -Id $NewNIC.Id

# Show the Network interfaces

#we have to set one of the NICs to Primary, i will set the first NIC in this example
$VM.NetworkProfile.NetworkInterfaces.Item(0).Primary = $true

#Update the VM configuration (The VM will be restarted)
Update-AzureRmVM -VM $VM -ResourceGroupName $VMRG


#Declare Variables NODE2
$VNET = Get-AzureRmVirtualNetwork -Name ‘BASF1030-VN1’ -ResourceGroupName ‘BASF1030-NWRG'
$SubnetID = (Get-AzureRmVirtualNetworkSubnetConfig -Name ‘BASFvn1-clustersub’ -VirtualNetwork $VNET).Id
$NICName = ‘basf-sql02clusternic’
$NICResourceGroup = ‘BASF1030-NWRG’
$Location = ‘Germany Northeast’
$IPAddress = ‘172.22.13.229’
$VMname = ‘BASF1030-SQL02’
$VMRG =  ‘BASF1030-VMRG'

#Get the VM
$VM = Get-AzureRmVM -Name $VMname -ResourceGroupName $VMRG

#Add the second NIC
$NewNIC =  Get-AzureRmNetworkInterface -Name $NICName -ResourceGroupName $NICResourceGroup
Add-AzureRmVMNetworkInterface -VM $VM -Id $NewNIC.Id

# Show the Network interfaces

#we have to set one of the NICs to Primary, i will set the first NIC in this example
$VM.NetworkProfile.NetworkInterfaces.Item(0).Primary = $true

#Update the VM configuration (The VM will be restarted)
Update-AzureRmVM -VM $VM -ResourceGroupName $VMRG

