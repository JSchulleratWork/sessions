Write-Output "Creating job credentials..."
$jobAgent= Get-AzureRmSqlElasticJobAgent -ResourceGroupName "SQLAgentDemos" -ServerName "SQLAgentDemo" -Name "DemoJobAgent"
$LoginPasswordSecure = (ConvertTo-SecureString -String "password!123" -AsPlainText -Force)

$MasterCred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList "masteruser", $LoginPasswordSecure
$MasterCred = $JobAgent | New-AzureRmSqlElasticJobCredential -Name "mastercred" -Credential $MasterCred

$JobCred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList "jobuser", $LoginPasswordSecure
$JobCred = $JobAgent | New-AzureRmSqlElasticJobCredential -Name "jobcred" -Credential $JobCred

$LoginPasswordSecure = (ConvertTo-SecureString -String "4IvufzC64R3z" -AsPlainText -Force)
$JobCred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList "DBAdmin", $LoginPasswordSecure
$JobCred = $JobAgent | New-AzureRmSqlElasticJobCredential -Name "dbadmin" -Credential $JobCred