# Terraformer Windows
Download az cli
Download Terraform
Add Terraform to Env Vars system PATH
Download az

# or 
```
choco install terraform -y
choco install azcli -y
```

# get aztfexport
https://github.com/Azure/aztfexport
https://techcommunity.microsoft.com/blog/itopstalkblog/azure-terrafy-%E2%80%93-import-your-existing-azure-infrastructure-into-terraform-hcl/3357653
```
Invoke-WebRequest https://github.com/Azure/aztfexport/releases/download/v0.16.0/aztfexport_v0.16.0_windows_amd64.zip -Outfile aztfexport.zip
Expand-Archive -Path "aztfexport.zip" -DestinationPath "."
```


# Create Importing workspace folder
```
mkdir Importing
cp .\aztfexport.exe .\Importing
cd Importing
```

# Pull All Resource Groups
```
az login
az group list --query '[].name' -o tsv > resource_groups.txt
```

# Review the list, break up into smaller chunks to prevent long running hard to break loop
notepad .\resource_groups.txt

# Create Folder for each, run the exporter in that current dir and loop back to worksapce dir to do it again and again
# run the script from Importing
.\Terraport.ps1