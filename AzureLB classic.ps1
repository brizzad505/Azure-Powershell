$svc="AX2012R3-Production-ATCC-PRD-01-DS2-d81322ffedcfdbc6"
$ilb="ATCCWest-SQLLB"
$subnet="atcc-uat-sql-ha-subnet"
$IP="10.1.6.5"

Add-AzureInternalLoadBalancer -ServiceName $svc -InternalLoadBalancerName $ilb –SubnetName $subnet –StaticVNetIPAddress $IP








$svc="ATCCWest-SQLDB"
$vmname="DB1"
$epname="TCP-1433-1433"
$lbsetname="lbset"
$prot="tcp"
$locport=1433
$pubport=1433
$ilb="ilbset"
Get-AzureVM –ServiceName $svc –Name $vmname | Add-AzureEndpoint -Name $epname -Lbset $lbsetname -Protocol $prot -LocalPort $locport -PublicPort $pubport –DefaultProbe -InternalLoadBalancerName $ilb | Update-AzureVM