#Connect-AzAccount
#Uninstall-AzureRm
#
Enable-AzureRmAlias
#
clear

$subscription_name = "MS DataLake"
$ResourceGroup = "rg-dev-br-datalake"
$SubscriptionId = "31a766b1-e9bf-477b-b7b5-7cb19b5b03cd"
$storage_account_name = "sadevbrdatalakemalwee"
$my_container = "raw"
$my_parent_directory = "brazil"
$userID = "5cf55a53-8535-40c5-8360-98ce4b33c388";

#########################################################################
## userid do Nei      6b55d94f-0de4-45ff-8b07-02a0fcae4737   
## object id ronan    5cf55a53-8535-40c5-8360-98ce4b33c388
#########################################################################

#install-module Az.Accounts

#Install-Module Az.Storage -Repository PSGallery -Force

#Get-PSRepository
#Import-Module Az.Storage
#Import-Module Az.Accounts


Select-AzSubscription -SubscriptionId $SubscriptionId
$storageAccount = Get-AzStorageAccount -ResourceGroupName $ResourceGroup -AccountName $storage_account_name
$ctx = $storageAccount.Context

$filesystemName = $my_container
$dirname = $my_parent_directory 


#$acl = Set-AzDataLakeGen2ItemAclObject -AccessControlType user -Permission rwx 

$acl = Set-AzDataLakeGen2ItemAclObject -AccessControlType user -EntityId $userID -Permission rwx
Update-AzDataLakeGen2AclRecursive -Context $ctx -FileSystem $filesystemName -Path $dirname -Acl $acl
