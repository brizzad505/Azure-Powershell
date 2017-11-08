#Login to ARM
Login-AzureRmAccount
#Login 
Add-AzureAccount 

###Check subscription default
    #ARM:
        Get-AzureRmSubscription
    #ASM
        Get-AzureSubscription

#ARM: Register for migration
Register-AzureRmResourceProvider -ProviderNamespace Microsoft.ClassicInfrastructureMigrate
 <#Output

 ProviderNamespace : Microsoft.ClassicInfrastructureMigrate
RegistrationState : Registered
ResourceTypes     : {classicInfrastructureResources}
Locations         : {East Asia, Southeast Asia, East US, East US 2...}
#>


#variables
$ASM_VNETNAME = "migtest2-vn1"
$ARM_RGName = "MIGTEST-RG1"

Move-AzureVirtualNetwork -Validate -VirtualNetworkName $ASM_VNETNAME
    #Output???
    <#OperationId        : 7519cffb-1805-3766-a4ad-264e4371f2fb
      Result             : Validation failed.  Please see ValidationMessages for details
      ValidationMessages : {migtest2-vn1}
#>

Move-AzureVirtualNetwork -Prepare -VirtualNetworkName $ASM_VNETNAME
Move-AzureVirtualNetwork -commit -VirtualNetworkName $ASM_VNETNAME

<#OperationDescription     OperationId                          OperationStatus
--------------------     -----------                          ---------------
Move-AzureVirtualNetwork 72e69de1-97b4-3423-a0cc-15e3f9020832 Succeeded 
#>


###At this stage, you should see your VNET and its VMs migrated to ARM###