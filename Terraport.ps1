# az group list --query '[].name' -o tsv > resource_groups.txt

# Read the resource group names from resource_groups.txt
$resourceGroups = Get-Content -Path "resource_groups.txt"

# Create a folder for each resource group name
foreach ($group in $resourceGroups) {
    if ($group -ne "") {  # Ensure the folder name is not empty
        New-Item -ItemType Directory -Name $group -Force
    }
}

Write-Output "Folders have been created for each resource group name."

# Get the list of folders from resource_groups.txt
$resourceGroups = Get-Content -Path "resource_groups.txt"

# Path to the aztfexport.exe binary
$aztfexportPath = "..\aztfexport.exe"

# Iterate over each folder
foreach ($group in $resourceGroups) {
    if ($group -ne "") {  # Ensure the folder name is not empty
        # Change directory to the folder
        Set-Location -Path $group
        
        # Run the aztfexport.exe command
        & $aztfexportPath rg $group
        
        # Change directory back to the parent directory
        Set-Location -Path ..
    }
}

Write-Output "aztfexport.exe has been run for each folder."