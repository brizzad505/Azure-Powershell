##Updates all help files for all modules
    Update-help

##Gets Powershell verions
    $PSVersionTable
###<Results>
    <#Name                           Value                                                                                                                   
        ----                           -----                                                                                                                   
    PSVersion                      5.1.15063.168                                                                                                           
    PSEdition                      Desktop                                                                                                                 
    PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}                                                                                                 
    BuildVersion                   10.0.15063.168                                                                                                          
    CLRVersion                     4.0.30319.42000                                                                                                         
    WSManStackVersion              3.0                                                                                                                     
    PSRemotingProtocolVersion      2.3                                                                                                                     
    SerializationVersion           1.1.0.1
    #>

##Seearched help files for *wildcards*
    help *event*


##Looking at Parameter sets for example "Get-EventLog"
    Get-Help -Name Get-eventlog
    #<Results>
    <#NAME
    Get-EventLog
    
SYNOPSIS
    Gets the events in an event log, or a list of the event logs, on the local or remote computers.
    
    
SYNTAX
    Get-EventLog [-LogName] <String> [[-InstanceId] <Int64[]>] [-After <DateTime>] [-AsBaseObject] [-Before <DateTime>] [-ComputerName <String[]>] 
    [-EntryType {Error | Information | FailureAudit | SuccessAudit | Warning}] [-Index <Int32[]>] [-Message <String>] [-Newest <Int32>] [-Source 
    <String[]>] [-UserName <String[]>] [<CommonParameters>]
    
    Get-EventLog [-AsString] [-ComputerName <String[]>] [-List] [<CommonParameters>]
    
    
DESCRIPTION
    The Get-EventLog cmdlet gets events and event logs on the local and remote computers.
    
    You can use the parameters of this cmdlet to search for events by using their property values. This cmdlet gets only the events that match all of 
    the specified property values.
    
    The cmdlets that contain the EventLog noun work only on classic event logs. To get events from logs that use the Windows Event Log technology in 
    Windows Vista and later versions of Windows, use Get-WinEvent.
    

RELATED LINKS
    Online Version: http://go.microsoft.com/fwlink/?LinkId=821585
    Clear-EventLog 
    Limit-EventLog 
    New-EventLog 
    Remove-EventLog 
    Show-EventLog 
    Write-EventLog 

REMARKS
    To see the examples, type: "get-help Get-EventLog -examples".
    For more information, type: "get-help Get-EventLog -detailed".
    For technical information, type: "get-help Get-EventLog -full".
    For online help, type: "get-help Get-EventLog -online"
    #>

##Looking for mandadroy and Optional Parameters.  Any param not in sqaure brackets is manadory whereas any in are optional (see -ComputerName and -Logname)
    Get-Help -Name Get-eventlog
    #<Results>
    <#NAME
    Get-EventLog
    
SYNOPSIS
    Gets the events in an event log, or a list of the event logs, on the local or remote computers.
    
    
SYNTAX
    Get-EventLog [-LogName] <String> [[-InstanceId] <Int64[]>] [-After <DateTime>] [-AsBaseObject] [-Before <DateTime>] [-ComputerName <String[]>] 
    [-EntryType {Error | Information | FailureAudit | SuccessAudit | Warning}] [-Index <Int32[]>] [-Message <String>] [-Newest <Int32>] [-Source 
    <String[]>] [-UserName <String[]>] [<CommonParameters>]
    
    Get-EventLog [-AsString] [-ComputerName <String[]>] [-List] [<CommonParameters>]
    
    
DESCRIPTION
    The Get-EventLog cmdlet gets events and event logs on the local and remote computers.
    
    You can use the parameters of this cmdlet to search for events by using their property values. This cmdlet gets only the events that match all of 
    the specified property values.
    
    The cmdlets that contain the EventLog noun work only on classic event logs. To get events from logs that use the Windows Event Log technology in 
    Windows Vista and later versions of Windows, use Get-WinEvent.
    

RELATED LINKS
    Online Version: http://go.microsoft.com/fwlink/?LinkId=821585
    Clear-EventLog 
    Limit-EventLog 
    New-EventLog 
    Remove-EventLog 
    Show-EventLog 
    Write-EventLog 

REMARKS
    To see the examples, type: "get-help Get-EventLog -examples".
    For more information, type: "get-help Get-EventLog -detailed".
    For technical information, type: "get-help Get-EventLog -full".
    For online help, type: "get-help Get-EventLog -online"
    #>

    
##positional parameters
    # Syntax in help file: Get-EventLog [-LogName] <String> [[-InstanceId] <Int64[]>]
    Get-eventlog System 1500
   

##Get full help file
    Help Get-EventLog -Full
    Help Get-EventLog -ShowWindow  #(only works on Windows OS)



    
########################CHAPTER 4!
# covers using PS for CLI command

Show-command


###Dealing with errors


PS C:\WINDOWS\system32> Get-History -Count 50

  Id CommandLine                                                                                                                                       
  -- -----------                                                                                                                                       
   1 vcbmounter.exe                                                                                                                                    
   2 $n = "bits"                                                                                                                                       
   3 sc.exe --% qc $n                                                                                                                                  
   4 sc.exe --% qc bits                                                                                                                                
   5 show-command                                                                                                                                      
   6 Show-command                                                                                                                                      
   7 show-command get-azurevm                                                                                                                          
   8 dir -Recurse                                                                                                                                      
   9  New-PSDrive -Name Bradsstuff                                                                                                                     
  10 Help *process*                                                                                                                                    
  11 Get-Process                                                                                                                                       
  12 help *event*                                                                                                                                      
  13 help Get-eventlog                                                                                                                                 
  14 show-command Get-eventlog                                                                                                                         
  15 Get-EventLog -LogName application -Newest 100                                                                                                     
  16 Help Get-command                                                                                                                                  
  17 Help Get-command -Full                                                                                                                            
  18 Get-Command -CommandType Cmdlet                                                                                                                   
  19 Get-Command -CommandType Alias                                                                                                                    
  20 New-Alias -Name np -Value notepad.exe                                                                                                             
  21 np                                                                                                                                                
  22 Get-Service -Name M*                                                                                                                              
  23 Help *firewall*                                                                                                                                   
  24 Get-NetFirewallSetting                                                                                                                            
  25 Show-command Get-NetFirewallSetting                                                                                                               
  26 Show-NetFirewallRule -PolicyStore                                                                                                                 
  27 Help Show-NetFirewallRule -PolicyStore                                                                                                            
  28 Help *Show-NetFirewallRule -PolicyStore*                                                                                                          
  29 Help *Show-NetFirewallRule*                                                                                                                       
  30 Get-NetFirewallRule -Direction Inbound                                                                                                            
  31 Help *command cache*                                                                                                                              
  32 Help *history*                                                                                                                                    
  33 Get-History -Count 20  



###Chapter 5: working with providers###
        
    #Gets a list of currently connected drives
        Get-PSDrive   
            <# Name           Used (GB)     Free (GB) Provider      Root                                                                                                                                                                                                                      CurrentLocation
----           ---------     --------- --------      ----                                                                                                                                                                                                                      ---------------
                Alias                                  Alias                                                                                                                                                                                                                                                  
                C                  83.38        162.45 FileSystem    C:\                                                                                                                                                                                                                 Users\bradhouseholder
                Cert                                   Certificate   \                                                                                                                                                                                                                                        
                D                  99.36        130.81 FileSystem    D:\                                                                                                                                                                                                                                      
                Env                                    Environment                                                                                                                                                                                                                                            
                Function                               Function                                                                                                                                                                                                                                               
                HKCU                                   Registry      HKEY_CURRENT_USER                                                                                                                                                                                                                        
                HKLM                                   Registry      HKEY_LOCAL_MACHINE                                                                                                                                                                                                                       
                Variable                               Variable                                                                                                                                                                                                                                               
                WSMan                                  WSMan   

#>

        Get-Command -noun *item*
        <#      CommandType     Name                                               Version    Source                                                                                                                                                                                                          
                -----------     ----                                               -------    ------                                                                                                                                                                                                          
                Alias           Add-AdlStoreItemContent                            4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Alias           Export-AdlStoreItem                                4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Alias           Get-AdlCatalogItem                                 3.2.0      AzureRM.DataLakeAnalytics                                                                                                                                                                                       
                Alias           Get-AdlStoreChildItem                              4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Alias           Get-AdlStoreItem                                   4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Alias           Get-AdlStoreItemAclEntry                           4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Alias           Get-AdlStoreItemContent                            4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Alias           Get-AdlStoreItemOwner                              4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Alias           Get-AdlStoreItemPermission                         4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Alias           Get-ASRProtectableItem                             0.1.0      AzureRM.RecoveryServices.SiteRecovery                                                                                                                                                                           
                Alias           Get-ASRReplicationProtectedItem                    0.1.0      AzureRM.RecoveryServices.SiteRecovery                                                                                                                                                                           
                Alias           Import-AdlStoreItem                                4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Alias           Join-AdlStoreItem                                  4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Alias           Move-AdlStoreItem                                  4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Alias           New-AdlStoreItem                                   4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Alias           New-ASRReplicationProtectedItem                    0.1.0      AzureRM.RecoveryServices.SiteRecovery                                                                                                                                                                           
                Alias           Remove-AdlStoreItem                                4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Alias           Remove-AdlStoreItemAcl                             4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Alias           Remove-AdlStoreItemAclEntry                        4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Alias           Remove-ASRReplicationProtectedItem                 0.1.0      AzureRM.RecoveryServices.SiteRecovery                                                                                                                                                                           
                Alias           Set-AdlStoreItemAcl                                4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Alias           Set-AdlStoreItemAclEntry                           4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Alias           Set-AdlStoreItemExpiry                             4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Alias           Set-AdlStoreItemOwner                              4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Alias           Set-AdlStoreItemPermission                         4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Alias           Set-ASRReplicationProtectedItem                    0.1.0      AzureRM.RecoveryServices.SiteRecovery                                                                                                                                                                           
                Alias           Test-AdlCatalogItem                                3.2.0      AzureRM.DataLakeAnalytics                                                                                                                                                                                       
                Alias           Test-AdlStoreItem                                  4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Function        Get-DAEntryPointTableItem                          1.0.0.0    DirectAccessClientComponents                                                                                                                                                                                    
                Function        Get-TestDriveItem                                  3.4.0      Pester                                                                                                                                                                                                          
                Function        New-DAEntryPointTableItem                          1.0.0.0    DirectAccessClientComponents                                                                                                                                                                                    
                Function        Remove-DAEntryPointTableItem                       1.0.0.0    DirectAccessClientComponents                                                                                                                                                                                    
                Function        Rename-DAEntryPointTableItem                       1.0.0.0    DirectAccessClientComponents                                                                                                                                                                                    
                Function        Reset-DAEntryPointTableItem                        1.0.0.0    DirectAccessClientComponents                                                                                                                                                                                    
                Function        Set-DAEntryPointTableItem                          1.0.0.0    DirectAccessClientComponents                                                                                                                                                                                    
                Cmdlet          Add-AzureRmDataLakeStoreItemContent                4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Cmdlet          Backup-AzureRmBackupItem                           3.2.0      AzureRM.Backup                                                                                                                                                                                                  
                Cmdlet          Backup-AzureRmRecoveryServicesBackupItem           3.2.0      AzureRM.RecoveryServices.Backup                                                                                                                                                                                 
                Cmdlet          Clear-Item                                         3.1.0.0    Microsoft.PowerShell.Management                                                                                                                                                                                 
                Cmdlet          Clear-ItemProperty                                 3.1.0.0    Microsoft.PowerShell.Management                                                                                                                                                                                 
                Cmdlet          Copy-Item                                          3.1.0.0    Microsoft.PowerShell.Management                                                                                                                                                                                 
                Cmdlet          Copy-ItemProperty                                  3.1.0.0    Microsoft.PowerShell.Management                                                                                                                                                                                 
                Cmdlet          Export-AzureRmDataLakeStoreItem                    4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Cmdlet          Get-AzureRmBackupItem                              3.2.0      AzureRM.Backup                                                                                                                                                                                                  
                Cmdlet          Get-AzureRmDataLakeAnalyticsCatalogItem            3.2.0      AzureRM.DataLakeAnalytics                                                                                                                                                                                       
                Cmdlet          Get-AzureRmDataLakeStoreChildItem                  4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Cmdlet          Get-AzureRmDataLakeStoreItem                       4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Cmdlet          Get-AzureRmDataLakeStoreItemAclEntry               4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Cmdlet          Get-AzureRmDataLakeStoreItemContent                4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Cmdlet          Get-AzureRmDataLakeStoreItemOwner                  4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Cmdlet          Get-AzureRmDataLakeStoreItemPermission             4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Cmdlet          Get-AzureRmRecoveryServicesAsrProtectableItem      0.1.0      AzureRM.RecoveryServices.SiteRecovery                                                                                                                                                                           
                Cmdlet          Get-AzureRmRecoveryServicesAsrReplicationProtec... 0.1.0      AzureRM.RecoveryServices.SiteRecovery                                                                                                                                                                           
                Cmdlet          Get-AzureRmRecoveryServicesBackupItem              3.2.0      AzureRM.RecoveryServices.Backup                                                                                                                                                                                 
                Cmdlet          Get-AzureRmSiteRecoveryProtectableItem             4.2.0      AzureRM.SiteRecovery                                                                                                                                                                                            
                Cmdlet          Get-AzureRmSiteRecoveryReplicationProtectedItem    4.2.0      AzureRM.SiteRecovery                                                                                                                                                                                            
                Cmdlet          Get-AzureWebsiteMetric                             4.2.0      Azure                                                                                                                                                                                                           
                Cmdlet          Get-ChildItem                                      3.1.0.0    Microsoft.PowerShell.Management                                                                                                                                                                                 
                Cmdlet          Get-ControlPanelItem                               3.1.0.0    Microsoft.PowerShell.Management                                                                                                                                                                                 
                Cmdlet          Get-Item                                           3.1.0.0    Microsoft.PowerShell.Management                                                                                                                                                                                 
                Cmdlet          Get-ItemProperty                                   3.1.0.0    Microsoft.PowerShell.Management                                                                                                                                                                                 
                Cmdlet          Get-ItemPropertyValue                              3.1.0.0    Microsoft.PowerShell.Management                                                                                                                                                                                 
                Cmdlet          Get-OBRecoverableItem                              2.0.0.0    MSOnlineBackup                                                                                                                                                                                                  
                Cmdlet          Import-AzureRmDataLakeStoreItem                    4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Cmdlet          Invoke-Item                                        3.1.0.0    Microsoft.PowerShell.Management                                                                                                                                                                                 
                Cmdlet          Join-AzureRmDataLakeStoreItem                      4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Cmdlet          Move-AzureRmDataLakeStoreItem                      4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Cmdlet          Move-Item                                          3.1.0.0    Microsoft.PowerShell.Management                                                                                                                                                                                 
                Cmdlet          Move-ItemProperty                                  3.1.0.0    Microsoft.PowerShell.Management                                                                                                                                                                                 
                Cmdlet          New-AzureRmDataLakeStoreItem                       4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Cmdlet          New-AzureRmRecoveryServicesAsrReplicationProtec... 0.1.0      AzureRM.RecoveryServices.SiteRecovery                                                                                                                                                                           
                Cmdlet          New-AzureRmSiteRecoveryReplicationProtectedItem    4.2.0      AzureRM.SiteRecovery                                                                                                                                                                                            
                Cmdlet          New-Item                                           3.1.0.0    Microsoft.PowerShell.Management                                                                                                                                                                                 
                Cmdlet          New-ItemProperty                                   3.1.0.0    Microsoft.PowerShell.Management                                                                                                                                                                                 
                Cmdlet          New-OBRecoverableItem                              2.0.0.0    MSOnlineBackup                                                                                                                                                                                                  
                Cmdlet          Remove-AzureRmDataLakeStoreItem                    4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Cmdlet          Remove-AzureRmDataLakeStoreItemAcl                 4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Cmdlet          Remove-AzureRmDataLakeStoreItemAclEntry            4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Cmdlet          Remove-AzureRmRecoveryServicesAsrReplicationPro... 0.1.0      AzureRM.RecoveryServices.SiteRecovery                                                                                                                                                                           
                Cmdlet          Remove-AzureRmSiteRecoveryReplicationProtectedItem 4.2.0      AzureRM.SiteRecovery                                                                                                                                                                                            
                Cmdlet          Remove-Item                                        3.1.0.0    Microsoft.PowerShell.Management                                                                                                                                                                                 
                Cmdlet          Remove-ItemProperty                                3.1.0.0    Microsoft.PowerShell.Management                                                                                                                                                                                 
                Cmdlet          Rename-Item                                        3.1.0.0    Microsoft.PowerShell.Management                                                                                                                                                                                 
                Cmdlet          Rename-ItemProperty                                3.1.0.0    Microsoft.PowerShell.Management                                                                                                                                                                                 
                Cmdlet          Restore-AzureRmBackupItem                          3.2.0      AzureRM.Backup                                                                                                                                                                                                  
                Cmdlet          Restore-AzureRmRecoveryServicesBackupItem          3.2.0      AzureRM.RecoveryServices.Backup                                                                                                                                                                                 
                Cmdlet          Set-AzureRmDataLakeStoreItemAcl                    4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Cmdlet          Set-AzureRmDataLakeStoreItemAclEntry               4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Cmdlet          Set-AzureRmDataLakeStoreItemExpiry                 4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Cmdlet          Set-AzureRmDataLakeStoreItemOwner                  4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Cmdlet          Set-AzureRmDataLakeStoreItemPermission             4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           
                Cmdlet          Set-AzureRmRecoveryServicesAsrReplicationProtec... 0.1.0      AzureRM.RecoveryServices.SiteRecovery                                                                                                                                                                           
                Cmdlet          Set-AzureRmSiteRecoveryReplicationProtectedItem    4.2.0      AzureRM.SiteRecovery                                                                                                                                                                                            
                Cmdlet          Set-Item                                           3.1.0.0    Microsoft.PowerShell.Management                                                                                                                                                                                 
                Cmdlet          Set-ItemProperty                                   3.1.0.0    Microsoft.PowerShell.Management                                                                                                                                                                                 
                Cmdlet          Show-ControlPanelItem                              3.1.0.0    Microsoft.PowerShell.Management                                                                                                                                                                                 
                Cmdlet          Test-AzureRmDataLakeAnalyticsCatalogItem           3.2.0      AzureRM.DataLakeAnalytics                                                                                                                                                                                       
                Cmdlet          Test-AzureRmDataLakeStoreItem                      4.2.0      AzureRM.DataLakeStore                                                                                                                                                                                           


        /#>


Get-ItemProperty -path Env:\PSModulePath
    #Doesnt support item properties#
        <#Get-ItemProperty : Cannot use interface. The IPropertyCmdletProvider interface is not supported by this provider.
        At line:1 char:1
        + Get-ItemProperty -path Env:\PSModulePath
        + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            + CategoryInfo          : NotImplemented: (:) [Get-ItemProperty], PSNotSupportedException
            + FullyQualifiedErrorId : NotSupported,Microsoft.PowerShell.Commands.GetItemPropertyCommand
 /#>

