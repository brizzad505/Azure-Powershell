####Backup restore Script v2#####
Get-AzureRmRecoveryServicesVault -Name ATCC-RecoveryServicesVault -ResourceGroupName RG-ATCC-RecoveryServiceVault
$recoveryvault = Get-AzureRmRecoveryServicesVault -Name ATCC-RecoveryServicesVault -ResourceGroupName RG-ATCC-RecoveryServiceVault
RG-ATCC-RecoveryServiceVau
Get-AzureRmRecoveryServicesBackupContainer -ContainerType AzureVM
Get-AzureRmRecoveryServicesBackupItem -BackupManagementType AzureVM -WorkloadType AzureVM | fl
    #or
Get-AzureRmRecoveryServicesBackupItem -BackupManagementType AzureVM -WorkloadType AzureVM | format-wide
$aos1nbkpitem = Get-AzureRmRecoveryServicesBackupItem -BackupManage
Get-AzureRmRecoveryServicesBackupRecoveryPoint -Item $aos1nbkpitem
#July 1st Backup hob 
     $aosrecpointidNum = 200980005628511
#June 27th Backup Job
     $aosrecpointidNum = 200032868240592
Get-AzureRmRecoveryServicesBackupRecoveryPoint -Item $aos1nbkpitem -RecoveryPointId $aosrecpointidNum
$aosrecpointid = Get-AzureRmRecoveryServicesBackupRecoveryPoint -Item $aos1nbkpitem -RecoveryPointId $aosrecpointidNum
Restore-AzureRmRecoveryServicesBackupItem -RecoveryPoint $aosrecpointid -StorageAccountName sandboxwest -StorageAccountResourceGroupName ATCC



