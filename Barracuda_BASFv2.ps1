Login-AzureRmAccount -EnvironmentName AzureGermanCloud
Set-AzureRmContext -SubscriptionId "58897c77-c959-43a0-923f-f3c3b71c08fd"




####ACTIVE SCRIPT####

#################################################
# Modify the variables below
#################################################
# Enable verbose output and stop on error
$VerbosePreference = 'Continue'
$ErrorActionPreference = 'Stop'

# Location 
$location = 'germanynortheast' # E.g., West Europe

# Storage Account Name 
$storageAccountName = 'basf1031stdstr' 
$storageAccountContainerName = 'vhdbyol'
$storageAccountResourceGroupName = 'BASF1030-STRG'

# Enter to use a User Defined VM image E.g., https://docstorage0.blob.core.windows.net/vhds/GWAY-6.2.0-216-Azure.vhd 
# Leave empty to use the latest image from the Azure Marketplace 
$customSourceImageUri = 'https://basf1031stdstr.blob.core.cloudapi.de/vhdbyol/GWAY-7.0.2-094-Azure.vhd' 

# Select the License type 
$vmLicenseType = 'byol' # set this to 'hourly' to use the PAYG image, or 'byol' for the BYOL image

# Set the product type 
$vmProductType ='barracuda-ng-firewall' # Use 'barracuda-ng-firewall' for F-Series Firewall or 'barracuda-ng-cc' for the NextGen Control Center

# VNET 
$vnetName = 'BASF1030-VN1'
$vnetResourceGroupName = 'BASF1030-NWRG'

# Availability Set
# always set a availability set in case you want to deploy a second firewall for HA later. 
$vmAvSetName ='NGF-AV-SET'

# Static IP address for the NIC
$nic1InternalIP = '172.22.12.5' # always make sure this IP address is available or leave this variable empty to use the next available IP address

# Barracuda NextGen Firewall F VM settings
$NGFResourceGroupName = 'BASF1030-NWRG'
$rootPassword = 'Tr1br|dg3!!!'
$vmSuffix = 'BASF1030' #
$vmName = 'BASF1030-NGF' -f $vmSuffix
$vmSize = 'Standard_Ds1_v2' 
$nicName = '{0}-NIC1' -f $vmSuffix
$nicName2 = '{0}-NIC2' -f $vmSuffix
$ipName = '{0}-NSG-IP' -f $vmSuffix
$domName = $vmSuffix.ToLower()
$diskName = 'osdisk'
$datadiskName1 = 'datadisk1'
$datadiskName2 = 'datadisk2'
$datadiskName3 = 'datadisk3'
# size of a single data disk size in GB. Multiply the size by the number of disks to received the total disk size of the RAID device
$datadisksize = 40 


#############################################
#
# No configuration variables past this point 
#
#############################################

Write-Host 'Starting Deployment - this may take a while' 

# Authenticate
#Login-AzureRmAccount -EnvironmentName AzureGermanCloud
#Set-AzureRmContext -SubscriptionId "58897c77-c959-43a0-923f-f3c3b71c08fd"

# Create the ResourceGroup for the Barracuda NextGen Firewall F 
Write-Verbose ('Creating NGF Resource Group {0}' -f $NGFresourceGroupName)
New-AzureRmResourceGroup -Name $NGFresourceGroupName -Location $location -ErrorAction Stop


# Use existing storage account
$storageAccount = Get-AzureRmStorageAccount -Name $storageAccountName -ResourceGroupName $storageAccountResourceGroupName 

# Use an existing Virtual Network
Write-Verbose ('Using VNET {0} in Resource Group {1}' -f $vnetNamem,$vnetResourceGroupName )
$vnet = Get-AzureRmVirtualNetwork -Name $vnetName -ResourceGroupName $vnetResourceGroupName

# Create Availability Set if it does not exist yet
$vmAvSet = New-AzureRmAvailabilitySet -Name $vmAvSetName -ResourceGroupName $NGFResourceGroupName -Location $location -WarningAction SilentlyContinue

# Create the NIC and new Public IP
Write-Verbose 'Creating Public IP'  
$pip = Get-AzureRmPublicIpAddress -ResourceGroupName $NGFresourceGroupName -Name "BASF1030-NSG-IP"


Write-Verbose 'Creating NIC'  
if ($nic1InternalIP -eq '')
{
    $nic = New-AzureRmNetworkInterface -ResourceGroupName "basf1030-nwrg" -Location $location -Name "basf1030ngf-nic1" -PublicIpAddressId $pip.Id -SubnetId /subscriptions/58897c77-c959-43a0-923f-f3c3b71c08fd/resourceGroups/BASF1030-NWRG/providers/Microsoft.Network/virtualNetworks/BASF1030-VN1/subnets/NGF-sub -EnableIPForwarding
}
else
{
    $nic = New-AzureRmNetworkInterface -ResourceGroupName "basf1030-nwrg" -Location $location -Name "basf1030ngf-nic1" -PrivateIpAddress $nic1InternalIP -PublicIpAddressId $pip.Id -SubnetId /subscriptions/58897c77-c959-43a0-923f-f3c3b71c08fd/resourceGroups/BASF1030-NWRG/providers/Microsoft.Network/virtualNetworks/BASF1030-VN1/subnets/NGF-sub -EnableIPForwarding 
}

# NIC #2 - OPTIONAL
#$nic2 = $nic = New-AzureRmNetworkInterface -ResourceGroupName "basf1030-nwrg" -Location $location -Name "basf1030ngf-nic2" -PublicIpAddressId $pip.Id -SubnetId /subscriptions/58897c77-c959-43a0-923f-f3c3b71c08fd/resourceGroups/BASF1030-NWRG/providers/Microsoft.Network/virtualNetworks/BASF1030-VN1/subnets/NGF-sub -EnableIPForwarding


# Create the VM Configuration 

Write-Verbose 'Creating NGF VM Configuration'  

$vm = New-AzureRmVMConfig -VMName $vmName -VMSize $vmSize -AvailabilitySetId $vmAvSet.Id

# Set root password 
$cred = New-Object PSCredential 'placeholderusername', ($rootPassword | ConvertTo-SecureString -AsPlainText -Force)
$vm = Set-AzureRmVMOperatingSystem -VM $vm -Linux -ComputerName $vmName -Credential $cred -ErrorAction Stop

# Add primary network interface 
$vm = Add-AzureRmVMNetworkInterface -VM $vm -Id $nic.Id -ErrorAction Stop -Primary

# Add NIC #2 
#$vm = Add-AzureRmVMNetworkInterface -VM $vm -Id $nic2.Id -ErrorAction Stop

# generate the name for the OS disk 
$osDiskUri = '{0}vhds/{1}{2}.vhd' -f $storageAccount.PrimaryEndpoints.Blob.ToString(), $vmName.ToLower(), $diskName

# generate URI for the datadisks
$dataDiskUri1 = '{0}vhds/{1}{2}.vhd' -f $storageAccount.PrimaryEndpoints.Blob.ToString(), $vmName.ToLower(), $datadiskName1
$dataDiskUri2 = '{0}vhds/{1}{2}.vhd' -f $storageAccount.PrimaryEndpoints.Blob.ToString(), $vmName.ToLower(), $datadiskName2
$dataDiskUri3 = '{0}vhds/{1}{2}.vhd' -f $storageAccount.PrimaryEndpoints.Blob.ToString(), $vmName.ToLower(), $datadiskName3

# Set the name and storage for the OS Disk image. 
$vm = Set-AzureRmVMOSDisk -VM $vm -Name $diskName -VhdUri $osDiskUri -CreateOption fromImage


# Specify the OS disk with user image 
if ($customSourceImageUri -eq '')
{
    Write-Verbose 'Using lasted image from the Azure Marketplace'  
    $vm.Plan = @{'name'= $vmLicenseType; 'publisher'= 'barracudanetworks'; 'product' = $vmProductType}
    $vm = Set-AzureRmVMSourceImage -VM $vm -PublisherName 'barracudanetworks' -Skus $vmLicenseType -Offer $vmProductType -Version 'latest' -ErrorAction Stop
    $vm = Set-AzureRmVMOSDisk -VM $vm -Name $diskName -VhdUri $osDiskUri -CreateOption fromImage
}
else
{
    Write-Verbose ('Using user defined image {0}' -f $customSourceImageUri)
    $vm = Set-AzureRmVMOSDisk -VM $vm -Name $diskName -VhdUri $osDiskUri -CreateOption fromImage -SourceImageUri $customSourceImageUri -Linux
}

# add the datadisks 
Write-Verbose 'Adding data disks' 
$vm = Add-AzureRmVMDataDisk -VM $vm -Name $datadiskName1 -DiskSizeInGB $datadisksize -CreateOption Empty -Lun 1 -VhdUri $dataDiskUri1
$vm = Add-AzureRmVMDataDisk -VM $vm -Name $datadiskName2 -DiskSizeInGB $datadisksize -CreateOption Empty -Lun 2 -VhdUri $dataDiskUri2
$vm = Add-AzureRmVMDataDisk -VM $vm -Name $datadiskName3 -DiskSizeInGB $datadisksize -CreateOption Empty -Lun 3 -VhdUri $dataDiskUri3

Write-Verbose 'Creating Barracuda NextGen Firewall F VM. This can take a while ....'  
$result = New-AzureRmVM -ResourceGroupName $NGFresourceGroupName -Location $location -VM $vm


if($result.IsSuccessStatusCode -eq 'True') {  
   $result
   Write-Host ('Barracuda NextGen Firewall F VM ''{0}'' was successfully deployed.  Connect to the firewall at {2} with the username: root and password: {1}' -f $vmName, $rootPassword, (Get-AzureRmPublicIpAddress -ResourceGroupName $NGFResourceGroupName -Name $ipName).IpAddress)
} else {
    Write-Host ('Deployment Failed. {0}' -f $result.ReasonPhrase)
}






##Scracth   
    <#New-AzureRmResourceGroup -Name TestResourceGroup -Location centralus
    $frontendSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name frontendSubnet -AddressPrefix "10.0.1.0/24"
    $virtualNetwork = New-AzureRmVirtualNetwork -Name MyVirtualNetwork -ResourceGroupName TestResourceGroup -Location centralus -AddressPrefix "10.0.0.0/16" -Subnet $frontendSubnet
    Get-AzureRmVirtualNetworkSubnetConfig -Name frontendSubnet -VirtualNetwork $virtualNetwork
    /#>