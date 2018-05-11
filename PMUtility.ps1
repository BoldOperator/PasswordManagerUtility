#Adding a comment
$Groups = @()

function getGroups($groupsVar){

    $groupDN

    $groupsVar | %{
        $Error.Clear()
        try{
            $groupDN = (Get-ADGroup $_).distinguishedName
        }
        catch{

        }
        if (!$Error){
            $Groups += $groupDN
        }
    }

    Write-Output ("The following groups were confirmed:")

    $Groups
}

getGroups ("Custom Group 1","Custom Group 2","CustomDoesNotExist")

function adCmdlets(){
    # Check if AD cmdlets are installed and prompt to install them to continue; otherwise import them.
    if (!(Get-Module -ListAvailable -Name activedirectory)){
        $response = Read-Host "Active Directory modules are not installed. Do you want to install them now to continue? [Y/N]"
        switch ($response.ToLower()){
            "y" {
                Add-WindowsFeature RSAT-AD-PowerShell
                Import-Module activedirectory
            }
            "n" {
                Return
            }
        }
    
    }

    else {
        Import-Module activedirectory
    }
}