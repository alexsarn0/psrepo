<# 
#          Script: Check Azure Subscription Access                                           
#            Date: June 30, 2018                                                                     
#          Author: Alex Sarno, Kirithiga Balaji
#            
.SYNOPSIS 
Checks all of the subscriptions that you currently have rights to. 
 
.DESCRIPTION 
Checks all of the subscriptions that you currently have rights to.
 
.EXAMPLE 
PS> .\CheckSubscriptionAccess.ps1 
#> 

# logging to azure
try
 {
     Get-AzureRmSubscription | out-null
 }
 catch
 {
    if ($me -eq $null)
    {
        $me = Get-Credential
    } 
    Login-AzureRmAccount -Credential $me
 }
 
$subs = Get-AzureRmSubscription

$version = (Get-Module -ListAvailable -Name Azure -Refresh).Version 
if ($version -lt 4.2.2)
{
    write-host "your SDK version $version is no longer supported, please upgrade"
    exit
}

write-host "Sdk version: $version "

$subs = Get-AzureRmSubscription

# get a count and print out each sub
$x = 0
foreach ($sub in $subs)
{
    $x += 1
    Write-Host Subscription Name - ID: $sub.Name - $sub.Id
}
write-host "Total Suscriptions: $x"