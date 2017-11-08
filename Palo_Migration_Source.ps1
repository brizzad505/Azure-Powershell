Add-AzureRmAccount -TenantId "b36382fa-b70c-4941-8830-ef80c044ef89" -SubscriptionId "241b94ef-ccc7-40ff-ac18-19b84303e2a7"
Get-AzureRmVM -ResourceGroupName "WestEU2-fwRG" -Name basf1030palo
<#Results#
ResourceGroupName   : WestEU2-fwRG
Id                  : /subscriptions/241b94ef-ccc7-40ff-ac18-19b84303e2a7/resourceGroups/WestEU2-fwRG/providers/Microsoft.Compute/virtualMachines/basf1030palo
VmId                : 63e52ba1-ff16-474a-b47a-d96bf9ef2206
Name                : basf1030palo
Type                : Microsoft.Compute/virtualMachines
Location            : westeurope
Tags                : {}
HardwareProfile     : {VmSize}
NetworkProfile      : {NetworkInterfaces}
OSProfile           : {ComputerName, AdminUsername, LinuxConfiguration, Secrets}
Plan                : {Name, Publisher, Product}
ProvisioningState   : Succeeded
StorageProfile      : {ImageReference, OsDisk, DataDisks}
NetworkInterfaceIDs : {/subscriptions/241b94ef-ccc7-40ff-ac18-19b84303e2a7/resourceGroups/WestEU2-fwRG/providers/Microsoft.Network/networkInterfaces/basf1030palo-eth0, 
/subscriptions/241b94ef-ccc7-40ff-ac18-19b84303e2a7/resourceGroups/WestEU2-fwRG/providers/Microsoft.Network/networkInterfaces/basf1030palo-eth1, 
/subscriptions/241b94ef-ccc7-40ff-ac18-19b84303e2a7/resourceGroups/WestEU2-fwRG/providers/Microsoft.Network/networkInterfaces/basf1030palo-eth2}

#>

###Get Palo MGMT interface###
Get-AzureRmNetworkInterface -ResourceGroupName "WestEU2-fwRG" -Name basf1030palo-eth0
    <#Results#>
    <#ame                        : basf1030palo-eth0
ResourceGroupName           : WestEU2-fwRG
Location                    : westeurope
Id                          : /subscriptions/241b94ef-ccc7-40ff-ac18-19b84303e2a7/resourceGroups/WestEU2-fwRG/providers/Microsoft.Network/networkInterfaces/basf1030palo-eth0
Etag                        : W/"30064689-fb92-4ca0-a7e6-d9440df477e8"
ResourceGuid                : 2d3d2ac7-d886-4c1f-880e-fec1ed5ec423
ProvisioningState           : Succeeded
Tags                        : 
VirtualMachine              : {
                                "Id": "/subscriptions/241b94ef-ccc7-40ff-ac18-19b84303e2a7/resourceGroups/WestEU2-fwRG/providers/Microsoft.Compute/virtualMachines/basf1030palo"
                              }
IpConfigurations            : [
                                {
                                  "Name": "ipconfig-mgmt",
                                  "Etag": "W/\"30064689-fb92-4ca0-a7e6-d9440df477e8\"",
                                  "Id": "/subscriptions/241b94ef-ccc7-40ff-ac18-19b84303e2a7/resourceGroups/WestEU2-fwRG/providers/Microsoft.Network/networkInterfaces/basf1030palo-eth0/ipConfigurations/ipconfig-mgmt",
                                  "PrivateIpAddress": "172.22.16.4",
                                  "PrivateIpAllocationMethod": "Dynamic",
                                  "Subnet": {
                                    "Id": "/subscriptions/241b94ef-ccc7-40ff-ac18-19b84303e2a7/resourceGroups/WestEU2-fwRG/providers/Microsoft.Network/virtualNetworks/fwVNET/subnets/Mgmt",
                                    "ResourceNavigationLinks": []
                                  },
                                  "PublicIpAddress": {
                                    "Id": "/subscriptions/241b94ef-ccc7-40ff-ac18-19b84303e2a7/resourceGroups/WestEU2-fwRG/providers/Microsoft.Network/publicIPAddresses/concertoeurope"
                                  },
                                  "ProvisioningState": "Succeeded",
                                  "PrivateIpAddressVersion": "IPv4",
                                  "LoadBalancerBackendAddressPools": [],
                                  "LoadBalancerInboundNatRules": [],
                                  "Primary": true,
                                  "ApplicationGatewayBackendAddressPools": []
                                }
                              ]
DnsSettings                 : {
                                "DnsServers": [],
                                "AppliedDnsServers": []
                              }
EnableIPForwarding          : False
EnableAcceleratedNetworking : False
NetworkSecurityGroup        : null
Primary                     : True



#>


###Get Palo UnTrust interface###
Get-AzureRmNetworkInterface -ResourceGroupName "WestEU2-fwRG" -Name basf1030palo-eth1
    <#Results#>
    <#Name                        : basf1030palo-eth1
ResourceGroupName           : WestEU2-fwRG
Location                    : westeurope
Id                          : /subscriptions/241b94ef-ccc7-40ff-ac18-19b84303e2a7/resourceGroups/WestEU2-fwRG/providers/Microsoft.Network/networkInterfaces/basf1030palo-eth1
Etag                        : W/"261da154-3e58-4175-9070-4c9a465cf9ce"
ResourceGuid                : e4c0ff57-dbe1-44a0-8d3c-2c37a374be31
ProvisioningState           : Succeeded
Tags                        : 
VirtualMachine              : {
                                "Id": "/subscriptions/241b94ef-ccc7-40ff-ac18-19b84303e2a7/resourceGroups/WestEU2-fwRG/providers/Microsoft.Compute/virtualMachines/basf1030palo"
                              }
IpConfigurations            : [
                                {
                                  "Name": "ipconfig-untrust",
                                  "Etag": "W/\"261da154-3e58-4175-9070-4c9a465cf9ce\"",
                                  "Id": "/subscriptions/241b94ef-ccc7-40ff-ac18-19b84303e2a7/resourceGroups/WestEU2-fwRG/providers/Microsoft.Network/networkInterfaces/basf1030palo-eth1/ipConfigurations/ipconfig-untrust",
                                  "PrivateIpAddress": "172.22.16.36",
                                  "PrivateIpAllocationMethod": "Dynamic",
                                  "Subnet": {
                                    "Id": "/subscriptions/241b94ef-ccc7-40ff-ac18-19b84303e2a7/resourceGroups/WestEU2-fwRG/providers/Microsoft.Network/virtualNetworks/fwVNET/subnets/Untrust",
                                    "ResourceNavigationLinks": []
                                  },
                                  "ProvisioningState": "Succeeded",
                                  "PrivateIpAddressVersion": "IPv4",
                                  "LoadBalancerBackendAddressPools": [],
                                  "LoadBalancerInboundNatRules": [],
                                  "Primary": true,
                                  "ApplicationGatewayBackendAddressPools": []
                                }
                              ]
DnsSettings                 : {
                                "DnsServers": [],
                                "AppliedDnsServers": []
                              }
EnableIPForwarding          : True
EnableAcceleratedNetworking : False
NetworkSecurityGroup        : null
Primary                     : False
#>



###Get Palo Trust interface###
Get-AzureRmNetworkInterface -ResourceGroupName "WestEU2-fwRG" -Name basf1030palo-eth1
<#Results#>
<#Name                        : basf1030palo-eth2
ResourceGroupName           : WestEU2-fwRG
Location                    : westeurope
Id                          : /subscriptions/241b94ef-ccc7-40ff-ac18-19b84303e2a7/resourceGroups/WestEU2-fwRG/providers/Microsoft.Network/networkInterfaces/basf1030palo-eth2
Etag                        : W/"db57d745-5b5b-466c-a5a7-2b88d5906f5a"
ResourceGuid                : 2005cfb8-9636-4bf9-bd81-4ce7141cb9c1
ProvisioningState           : Succeeded
Tags                        : 
VirtualMachine              : {
                                "Id": "/subscriptions/241b94ef-ccc7-40ff-ac18-19b84303e2a7/resourceGroups/WestEU2-fwRG/providers/Microsoft.Compute/virtualMachines/basf1030palo"
                              }
IpConfigurations            : [
                                {
                                  "Name": "ipconfig-trust",
                                  "Etag": "W/\"db57d745-5b5b-466c-a5a7-2b88d5906f5a\"",
                                  "Id": "/subscriptions/241b94ef-ccc7-40ff-ac18-19b84303e2a7/resourceGroups/WestEU2-fwRG/providers/Microsoft.Network/networkInterfaces/basf1030palo-eth2/ipConfigurations/ipconfig-trust",
                                  "PrivateIpAddress": "172.22.16.68",
                                  "PrivateIpAllocationMethod": "Dynamic",
                                  "Subnet": {
                                    "Id": "/subscriptions/241b94ef-ccc7-40ff-ac18-19b84303e2a7/resourceGroups/WestEU2-fwRG/providers/Microsoft.Network/virtualNetworks/fwVNET/subnets/Trust",
                                    "ResourceNavigationLinks": []
                                  },
                                  "ProvisioningState": "Succeeded",
                                  "PrivateIpAddressVersion": "IPv4",
                                  "LoadBalancerBackendAddressPools": [],
                                  "LoadBalancerInboundNatRules": [],
                                  "Primary": true,
                                  "ApplicationGatewayBackendAddressPools": []
                                }
                              ]
DnsSettings                 : {
                                "DnsServers": [],
                                "AppliedDnsServers": []
                              }
EnableIPForwarding          : True
EnableAcceleratedNetworking : False
NetworkSecurityGroup        : null
Primary                     : False
#>