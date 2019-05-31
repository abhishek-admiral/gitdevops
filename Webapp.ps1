$azureAplicationId ="abhishek.it@hotmail.com"
$azureTenantId= "2ff36f57-a239-47e1-aec5-10c39a0f0a67"
$azurePassword = ConvertTo-SecureString "davincicode@123" -AsPlainText -Force
$psCred = New-Object System.Management.Automation.PSCredential($azureAplicationId , $azurePassword)
Connect-AzAccount -Credential $psCred -TenantId $azureTenantId  -ServicePrincipal 

#Delete Resource Group If exists

Remove-AzResourceGroup -Name JenkinsTesting -Force

# Replace the following URL with a public GitHub repo URL
$gitrepo="https://github.com/abhishek-admiral/gitdevops.git"
$webappname="mygitapp"
$location="West Europe"

# Create a resource group.
New-AzResourceGroup -Name JenkinsTesting -Location $location

# Create an App Service plan in Free tier.
New-AzAppServicePlan -Name $webappname -Location $location `
-ResourceGroupName JenkinsTesting -Tier Free

# Create a web app.
New-AzWebApp -Name $webappname -Location $location `
-AppServicePlan $webappname -ResourceGroupName JenkinsTesting

# Upgrade App Service plan to Standard tier (minimum required by deployment slots)
#Set-AzAppServicePlan -Name $webappname -ResourceGroupName JenkinsTesting `-Tier Standard

#Create a deployment slot with the name "staging".
#New-AzWebAppSlot -Name $webappname -ResourceGroupName JenkinsTesting `-Slot staging

# Configure GitHub deployment to the staging slot from your GitHub repo and deploy once.
#$PropertiesObject = @{
 #   repoUrl = "$gitrepo";
 #   branch = "master";
#}
#Set-AzResource -PropertyObject $PropertiesObject -ResourceGroupName JenkinsTesting `
#-ResourceType Microsoft.Web/sites/slots/sourcecontrols `
#-ResourceName $webappname/staging/web -ApiVersion 2015-08-01 -Force

# Swap the verified/warmed up staging slot into production.
#Switch-AzWebAppSlot -Name $webappname -ResourceGroupName myResourceGroup `
#-SourceSlotName staging -DestinationSlotName production