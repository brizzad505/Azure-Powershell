$vault= Get-AzureRmRecoveryServicesVault -Name "ATCC-RecoveryServicesVault"
PS C:\> Get-AzureRmRecoveryServicesVault -Name "testvault" | Set-AzureRmRecoveryServicesVaultContext

    ###Associate with subnets
        $VNet1E = Get-AzureRmVirtualNetwork -Name ATCC1972-VN1 -ResourceGroupName ATCC1972-NWRG
        Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $vnet1E -Name ATCCVN1-sbn_mgmt -AddressPrefix 172.22.16.160/27 -RouteTable $routeTableTE
        Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $vnet1E -Name ATCCVN1-sbn_mgmt2 -AddressPrefix 172.22.16.192/27 -RouteTable $routeTableTE
        Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $vnet1E -Name ATCCVN1-sbn_jump -AddressPrefix 172.22.16.224/27 -RouteTable $routeTableTE
        Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $vnet1E -Name ATCCVN1-sbn_rds -AddressPrefix 172.22.17.0/27 -RouteTable $routeTableTE
        Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $vnet1E -Name ATCCVN1-sbn_ftp -AddressPrefix 172.22.17.32/27 -RouteTable $routeTableTE
        Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $vnet1E -Name ATCCVN1-sbn_intweb -AddressPrefix 172.22.17.64/27 -RouteTable $routeTableTE
        Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $vnet1E -Name ATCCVN1-sbn_extweb -AddressPrefix 172.22.17.96/27 -RouteTable $routeTableTE
        Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $vnet1E -Name ATCCVN1-sbn_app -AddressPrefix 172.22.17.128/27 -RouteTable $routeTableTE
        Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $vnet1E -Name ATCCVN1-sbn_app2 -AddressPrefix 172.22.17.160/27 -RouteTable $routeTableTE
        Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $vnet1E -Name ATCCVN1-sbn_oltp -AddressPrefix 172.22.17.192/27 -RouteTable $routeTableTE
        Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $vnet1E -Name ATCCVN1-sbn_olap -AddressPrefix 172.22.17.224/27 -RouteTable $routeTableTE
        Set-AzureRmVirtualNetwork -VirtualNetwork $VNet1E



##Create Expressrout
New-AzureRmExpressRouteCircuit -Name ATCC1972-Exr1Gb -ResourceGroupName ATCC1972-NWRG -Location EASTUS -SkuTier Standard -SkuFamily MeteredData -ServiceProviderName EQUINIX -PeeringLocation 