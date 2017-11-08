Add-AzureRmAccount -TenantId c1e13085-249f-48b8-b354-fa698cee5b4f -SubscriptionId 6CEDFFF3-A5D4-4D2F-9F1D-2605168B507E
(Get-AzureRMVM -ResourceGroupName ASHUSEAST-RG -Name ASHEASTUS-WIN12).NetworkInterfaceIDs
Get-AzureRMVM -ResourceGroupName ASHUSEAST-RG -Name ASHEASTUS-WIN12
cd "C:\Program Files (x86)\Microsoft SDKs\Azure\"
AzCopy.exe /Source:"https://ashuseaststd.blob.core.windows.net/vhds" /Dest:"https://ashuseastprm.blob.core.windows.net/vhds" /SourceKey:qPl2IayVUnLnatcsUhsj96kdZYc+cT6xtl7EjxyFVBoJGMUiiR581GMZnNXf9waqvIihupdwf28zvUL+dmOBMQ== /DestKey: hOQq5vxtZ00E3JLd86vTHcY0xTbBfzNhVaMZ9jujwDvf6BAyB7XNsJ6Nhs/4FANdo4qNb7eB46vBmFpU/kro2Q==  /Pattern:ASHEASTUS-WIN1220170223235112.vhd



$SourceStr = 
$DestStr =
$SourceKey =
$DestKey =
$vhd = 

#networkinfID
(Get-AzureRMVM -ResourceGroupName NISS1762-RG1 -Name NISS1762-APP05T).NetworkInterfaceIDs
#Results: /subscriptions/80190c2e-bb6d-4b59-96e7-e30558cf715d/resourceGroups/NISS1762-RG1/providers/Microsoft.Network/networkInterfaces/niss1762-app05t3

App05T
.\AzCopy.exe /Source:"https://niss1762std.blob.core.windows.net/vhds" /Dest:"https://niss1762prodprem.blob.core.windows.net/vhds" /SourceKey:K9tyZyk/vLGIpq4KI5Quk4rR5vnnU3ebXC9e7U1nZ4ioNaNupgObDCgPbCmekgx5CINqsiKAs76DIraFe0BYIA== /DestKey:RJmxUr3wIftd2iFwIO57yN9gLhmmcjXXIcndtnotUGIqXv4OHn+CUaHDqgiB0iXBYUqAqHu93IY482vXmTvGnw==  /Pattern:NISS1762-APP05T201661415270.vhd



###Palo
.\AzCopy.exe /Source:"https://westeustd.blob.core.windows.net/vhds/" /Dest:"https://basf1031stdstr.blob.core.cloudapi.de/vhds/" /SourceKey:rnX05WNemeyCeaKF5NRYn4g76ic6ycHAxKKS4FXykDFBcDJSZyJIyYJdV5HkxXFsvir1ukE9y7Z4AZ5uf2nqTQ== /DestKey:zfmozSlcultLHdU0TiRXZCUSv72GagKVxVKUGf5k5c3xy6QTbV2JWrd8l+GQEeeVQMc84VCKwL5DKFQnCEa6ow== /Pattern:basf1030palo-vmseries1-byol.vhd