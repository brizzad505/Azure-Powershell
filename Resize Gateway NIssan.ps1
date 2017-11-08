Add-AzureRmAccount
$Gateway = Get-AzureRmVirtualNetworkGateway -Name "NISS1762-FWGW" -ResourceGroupName "NISS1762-RGFW"
Resize-AzureRmVirtualNetworkGateway -VirtualNetworkGateway $Gateway -GatewaySku "Standard"




##Results
<#Name                   : NISS1762-FWGW
ResourceGroupName      : NISS1762-RGFW
Location               : eastus
Id                     : /subscriptions/80190c2e-bb6d-4b59-96e7-e30558cf715d/resourceGroups/NISS1762-RGFW/providers/Microsoft.Network/virtualNetworkGateways/NISS1762-FWG
                         W
Etag                   : W/"27f95536-181d-4bf6-a2d0-bbcbbc34d347"
ResourceGuid           : 9925fcc7-b0c5-4029-8b90-b0bbfa3aa31e
ProvisioningState      : Succeeded
Tags                   : 
IpConfigurations       : [
                           {
                             "PrivateIpAllocationMethod": "Dynamic",
                             "Subnet": {
                               "Id": "/subscriptions/80190c2e-bb6d-4b59-96e7-e30558cf715d/resourceGroups/NISS1762-RGFW/providers/Microsoft.Network/virtualNetworks/NISS17
                         62-fwVN1/subnets/GatewaySubnet"
                             },
                             "PublicIpAddress": {
                               "Id": "/subscriptions/80190c2e-bb6d-4b59-96e7-e30558cf715d/resourceGroups/NISS1762-RGFW/providers/Microsoft.Network/publicIPAddresses/NISS
                         1762-fwGW-PubIP"
                             },
                             "Name": "default",
                             "Etag": "W/\"27f95536-181d-4bf6-a2d0-bbcbbc34d347\"",
                             "Id": "/subscriptions/80190c2e-bb6d-4b59-96e7-e30558cf715d/resourceGroups/NISS1762-RGFW/providers/Microsoft.Network/virtualNetworkGateways/N
                         ISS1762-FWGW/ipConfigurations/default"
                           }
                         ]
GatewayType            : ExpressRoute
VpnType                : PolicyBased
EnableBgp              : False
ActiveActive           : False
GatewayDefaultSite     : null
Sku                    : {
                           "Capacity": 2,
                           "Name": "Standard",
                           "Tier": "Standard"
                         }
VpnClientConfiguration : null
BgpSettings            : null
/#>