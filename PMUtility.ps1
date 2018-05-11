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