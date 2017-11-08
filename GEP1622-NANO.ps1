New-NanoServerImage -MediaPath 'I:\' -Edition 'Datacenter' -DeploymentType Guest -TargetPath 'E:\New folder\GEP1622-NANO.vhd' -MaxSize 1073741824 -EnableRemoteManagementPort -InterfaceNameOrIndex '1' -Ipv4Address '172.20.81.210' -Ipv4Dns '172.20.81.200' -Ipv4SubnetMask '255.255.255.224' -Ipv4Gateway '172.20.81.193' -SetupUI ('NanoServer.Containers') -DriverPath ('C:\VMware\Tools\Program Files\VMware\VMware Tools\Drivers\pvscsi\pvscsi.inf', 'C:\VMware\Tools\Program Files\VMware\VMware Tools\Drivers\scsi\vmscsi.inf') -ComputerName 'GEP1622-NANO' -SetupCompleteCommand ('tzutil.exe /s "Eastern Standard Time"', 'powershell.exe "Set-NetAdapter -Name (Get-NetAdapter -InterfaceIndex 1).Name -VlanID 1622 -Confirm:$false"') -LogPath 'C:\Users\bradhouseholder\AppData\Local\Temp\NanoServerImageBuilder\Logs\2017-05-31 14-42'




##admin: administrator
##Pass: Tr1bridg3!!!


###Take2 because brad smoked weed in college

New-NanoServerImage -MediaPath 'I:\' -Edition 'Datacenter' -DeploymentType Guest -TargetPath 'E:\Nano\GEP1622-NANO.vhd' -MaxSize 1073741824 -DomainName 'GEP1622.LOCAL' -ReuseDomainNode -EnableRemoteManagementPort -InterfaceNameOrIndex '1' -Ipv4Address '172.20.81.210' -Ipv4Dns '192.20.81.200' -Ipv4SubnetMask '255.255.255.224' -Ipv4Gateway '192.20.81.193' -SetupUI ('NanoServer.Containers') -DriverPath ('E:\Nano\Drivers\vmxnet3\Win8\vmxnet3.inf', 'E:\Nano\Drivers\pvscsi\Win8\pvscsi.inf', 'E:\Nano\Drivers\memctl\Win8\vmmemctl.inf', 'E:\Nano\Drivers\video_wddm\Vista\vm3d.inf', 'E:\Nano\Drivers\vmci\device\Win8\vmci.inf') -ComputerName 'GEP1622-NANO' -SetupCompleteCommand ('tzutil.exe /s "Eastern Standard Time"') -LogPath 'C:\Users\bradhouseholder\AppData\Local\Temp\NanoServerImageBuilder\Logs\2017-06-01 14-05'
