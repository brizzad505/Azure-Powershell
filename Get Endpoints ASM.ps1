$VMs = Import-Csv 
$Output += foreach ($VM In $VMs.VMs) {Get-AzureEndpoint -VM $VM}
$Output |Export-csv C:\Azure\outputhcm.csv -NoTypeInformation



