# gitdevops
Our project is to create a new webapp triggering Jenkins and deploy the files from this git repository

1. Created a new public Git Repository with git name gitdevops.The url for public git repo is https://github.com/abhishek-admiral/gitdevops
2. Added index.html,CreateWebapp.ps1 under it. CreateWebapp.ps1 contains the azure cli commands to create new resource group and webapp in azure and deploy the github files on webapp.
3. Installed Jenkins on the testing server with the url - http"\\172.16.11.237:8080. After that created a job with the Name GitProject. In the Jenkins provided the github url and credentials under SCM tab.
4. Azure is connected using Service Prinicipal in the build tab.To deploy on the Azure the powershell script (CreateWebapp.ps1)containing azure cli commands is running in post build step to deploy the github code to azure web app.


