 $storageAccount =
        (Get-AzureStorageAccount).Label `
        | Out-GridView `
            -Title "Select Azure Storage Account" `
            -PassThru
     
    Set-AzureSubscription `
        -SubscriptionName $subscription `
        -CurrentStorageAccountName $storageAccount

    # Select Azure VM
     
    $vm =
        Get-AzureVM `
        | Out-GridView `
            -Title "Select a VM ..." `
             -PassThru

    # Select Data Disk to resize
     
    $disk =
        $vm `
        | Get-AzureDataDisk `
        | Out-GridView `
            -Title "Select a data disk to resize" `
            -PassThru
     
    $diskName = $disk.DiskName

    # Specify new Data Disk size – must be larger than current size
     
    do {
     
        $size =
            Read-Host `
                -Prompt "New size in GB"

    }

    until ( $size -gt $disk.LogicalDiskSizeInGB )

    # Stop and Deallocate VM prior to resizing data disk
     
    $vm `
        | Stop-AzureVM `
             -Force

    # Resize Data Disk to Larger Size
     
    Update-AzureDisk `
        -Label "$diskName" `
        -DiskName "$diskName" `
        -ResizedSizeInGB $size

    # Start VM

    $vm | Start-AzureVM