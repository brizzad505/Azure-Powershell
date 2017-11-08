Add-AzureAccount 
$V1Resources = New-Object System.Collections.ArrayList
$csvV1 = 'C:\Azure\v1.csv'
$subV1 = Get-AzureSubscription
foreach($sub in $subV1){
$RunningV1VMs = $null
Select-AzureSubscription -SubscriptionId $sub.SubscriptionId

Set-AzureSubscription -SubscriptionId $sub.SubscriptionId
$RunningV1VMs += Get-AzureVM 


if(-not(!$RunningV1VMs)){
foreach($v1VM in $RunningV1VMs){
$v1vmname = $v1VM.Name
$v1vmservicename = $v1VM.ServiceName
$v1VMStatus = $v1VM.Status
$subnetcsv = New-Object -TypeName psobject
$subnetcsv | Add-Member -MemberType NoteProperty -Name Subscription -Value $sub.SubscriptionName
$subnetcsv | Add-Member -MemberType NoteProperty -Name VMName -Value $v1vmname
$subnetcsv | Add-Member -MemberType NoteProperty -Name ServiceName -Value $v1vmservicename
$subnetcsv | Add-Member -MemberType NoteProperty -Name Status -Value $v1VMStatus
$V1Resources.Add($subnetcsv) | Out-Null

                                }
                        }


                        }

                        $V1Resources  | Export-Csv -Path $csvV1 
