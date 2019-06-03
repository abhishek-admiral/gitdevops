az login --service-principal -u "fb8159f1-44fe-435a-9cca-32d96215bdee" -p "15550d55-038d-4774-82e8-fb8b9daed2cd" -t "2ff36f57-a239-47e1-aec5-10c39a0f0a67" 
az group delete --name JenkinsTesting -y
az group create --location westeurope --name JenkinsTesting
az appservice plan create --name mygitapp --resource-group JenkinsTesting --sku FREE
az webapp create --name mygitapp --resource-group JenkinsTesting --plan mygitapp
az webapp deployment source config --name mygitapp --resource-group JenkinsTesting --repo-url "https://github.com/abhishek-admiral/gitdevops.git" --branch master --manual-integration 
echo http://mygitapp.azurewebsites.net
