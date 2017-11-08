<#
    © 2016 Microsoft Corporation. All rights reserved. This sample code is not supported under any Microsoft standard support program or service. 
    This sample code is provided AS IS without warranty of any kind. Microsoft disclaims all implied warranties including, without limitation, 
    any implied warranties of merchantability or of fitness for a particular purpose. The entire risk arising out of the use or performance 
    of the sample code and documentation remains with you. In no event shall Microsoft, its authors, or anyone else involved in the creation, 
    production, or delivery of the scripts be liable for any damages whatsoever (including, without limitation, damages for loss of business 
    profits, business interruption, loss of business information, or other pecuniary loss) arising out of the use of or inability to use the 
    sample scripts or documentation, even if Microsoft has been advised of the possibility of such damages.
#>

Param
(
    [Parameter(Mandatory=$false)]         # Subscription Name
    [string]$SubscriptionName
)

# Login your subscription

Get-AzureAccount
if($SubscriptionName -eq ""){
    $subscriptions = Get-AzureSubscription -SubscriptionId 1034ac94-f8f0-4774-a1a7-80e137aa7c10
}
else{
    $subscriptions = Get-AzureSubscription -SubscriptionName $SubscriptionName
}

"{0}`t{1}`t{2}`t{3}`t{4}`t{5}`t{6}`t{7}`t{8}`t{9}`t{10}`t{11}`t{12}`t{13}`t{14}`t{15}" -f "SubscriptionName","ServiceName","VMName","VirtualNetworkName","Subnet","EndpointName","LBSetName","LocalPort","Port","Protocol","VIP","RuleId","Order","Action","RemoteSubnet","Description" | Out-File -FilePath "EndpointACLs.csv" -Append
foreach($subscription in $subscriptions){
    $subscriptionName=$subscription.SubscriptionName
    Select-AzureSubscription -SubscriptionName $subscription.SubscriptionName

    $vms=Get-AzureVM ;
    foreach($vm in $vms){
        $vm.name ; 
        $endpoints=Get-AzureEndpoint -VM $vm
        $vmsubnets=Get-AzureSubnet -VM $vm
        $VirtualNetworkName=$vm.VirtualNetworkName
            foreach($endpoint in $endpoints){
            $aclRules=$endpoint.Acl
            foreach($rule in $aclRules){
                "{0}`t{1}`t{2}`t{3}`t{4}`t{5}`t{6}`t{7}`t{8}`t{9}`t{10}`t{11}`t{12}`t{13}`t{14}`t{15}" -f $subscriptionName,$vm.ServiceName,$vm.name,$VirtualNetworkName,$vmsubnets,$endpoint.Name,$endpoint.LBSetName,$endpoint.LocalPort,$endpoint.Port,$endpoint.Protocol,$endpoint.VIP,$rule.RuleId,$rule.Order,$rule.Action,$rule.RemoteSubnet,$rule.Description | Out-File -FilePath "EndpointACLs.csv" -Append
                }
        
        }
        
    }
}