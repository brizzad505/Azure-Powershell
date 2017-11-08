$VMs = Import-Csv "C:\azure\Azure-Classic-VMs.csv"
$Output += foreach ($VM In $VMs.VMs) {Get-azurepublicIP -VM $VM}
$Output |Export-csv C:\Azure\atccvmpubIP.csv -NoTypeInformation



