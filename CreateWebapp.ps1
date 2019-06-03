# Login to the Azure using the Service Principal
az login --service-principal -u "fb8159f1-44fe-435a-9cca-32d96215bdee" -p "15550d55-038d-4774-82e8-fb8b9daed2cd" -t "2ff36f57-a239-47e1-aec5-10c39a0f0a67" 

#Delete the ResourceGroup if Exits and create again
az group delete --name JenkinsTesting -y

# Create a resource group.
az group create --location westeurope --name JenkinsTesting

# Create an App Service plan in `FREE` tier.
az appservice plan create --name mygitapp --resource-group JenkinsTesting --sku FREE

# Create a web app.
az webapp create --name mygitapp --resource-group JenkinsTesting --plan mygitapp

# Deploy code from a public GitHub repository.
az webapp deployment source config --name mygitapp --resource-group JenkinsTesting --repo-url "https://github.com/abhishek-admiral/gitdevops.git" --branch master --manual-integration 

# Copy the result of the following command into a browser to see the web app.
echo http://mygitapp.azurewebsites.net

#Unit test to check if the App is created and available using Request and Response from HTTP
$HTTP_Request = [System.Net.WebRequest]::Create('http://mygitapp.azurewebsites.net')
$HTTP_Response = $HTTP_Request.GetResponse()
$HTTP_Status = [int]$HTTP_Response.StatusCode

if($HTTP_Status -eq 200)
{
Write-Host "Site is OK!"
}
Else{
Write-Host "The site is down,please check!"
}
$HTTP_Response.Close()
