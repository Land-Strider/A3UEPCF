
$regValidName = "^[a-z][\w]*$"
"`n`nWelcome to the A3AU Extender first time setup!`n=================================================`n`n"
"Mod naming should follow these restrictions: [A-Z] [0-9] [_]`nit should also be all lowercase to maintain better compatibility with linux servers`nExample: a3ue_my_faction`n`n"

while ($true) {
    $exstensionName = Read-Host "Enter your extension name following theses rules:`n`n- Starting with a letter`n- Containing only the characters a-z 0-9 and _`n- Only containing lowercase letters`n"
    if ($exstensionName -cnotmatch $regValidName) {
        Write-Host "`n`nInvalid name try again`n" -ForegroundColor Red
    } else {
        break
    }
}


#find witch folder is the modfolder
$folders = Get-Childitem "$PSScriptRoot\..\.." -Directory
foreach ($folder in $folders) {
    $folderName = $folder.Name
    $subFolders = Get-Childitem "$PSScriptRoot\..\..\$folderName" -Directory
    $subFolders = $subFolders | Where-Object { $_.Name -eq "addons" }
    if (($subFolders | Measure-Object).Count -gt 0) {
        $oldExstensionName = $folderName
        break
    }
}

"`nRenaming mod folder"
Set-Location "$PSScriptRoot\..\.."
Rename-Item $oldExstensionName $exstensionName

"`nPreping mod for building"
Set-Location "$PSScriptRoot\..\..\$exstensionName"

"`nCreate mod_name.hpp in core\includes"
$modNameFile = "addons\core\Includes\mod_name.hpp"
if (Test-Path -Path $modNameFile -PathType Leaf) {
    Remove-Item $modNameFile
}

New-Item $modNameFile
Set-Content $modNameFile "#define MODFOLDER $exstensionName
#ifndef PREFIX
    #define PREFIX $exstensionName
#endif"

#create $PBOPREFIX$ files
forEach ($addon in (Get-Childitem ".\addons" -Directory)) {
    $addonName = $addon.Name

    # x\A3AE\addons\core
    "Creating `$PBOPREFIX$ for $addonName"
    $file = ".\addons\$addonName\`$PBOPREFIX$"
    if (!(Test-Path -Path $file -PathType Leaf)) {
        New-Item $file
    }
    Set-Content $file -NoNewline "x\$exstensionName\addons\$addonName"

    # Updating stringtable
    #$file = ".\addons\$addonName\Stringtable.xml"
    #if (Test-Path $file) { # disabled as this would require renaming each string reference aswell to work properly, not worth the effort
    #    $newContent = (Get-Content -path $file -Raw) -replace "STR_$oldExstensionName", "STR_$exstensionName" -replace "A3AExtender", $exstensionName
    #    Set-Content $file $newContent
    #}

    "Createing script_component for $addonName"
    $file = ".\addons\$addonName\script_component.hpp"
    if ($addonName -eq "core") { continue } #core has unique script_component
    if (!(Test-Path -Path $file -PathType Leaf)) {
        New-Item $file
    }
    Set-Content $file "#define COMPONENT $addonName
#include `"\x\$exstensionName\addons\core\Includes\script_mod.hpp`""

}

"`n`nMod preped for building`n=================================================`n"
