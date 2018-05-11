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

function adCmdlets(){
    # Check if AD cmdlets are installed and install them to continue; otherwise import them.
    if (!(Get-Module -ListAvailable -Name activedirectory)){
        Write-Host "Active Directory module is not installed. This required module will be installed in five seconds. Press CTRL+C to cancel."
        
        1..5 | foreach {
        sleep -Seconds 1 
        Write-Host "." -NoNewline
        }        
        
        Add-WindowsFeature RSAT-AD-PowerShell
        Import-Module activedirectory
                     
            
        }

    else {
        Write-Host "Active Directory module are installed. Importing..."
        Import-Module activedirectory
    }
}