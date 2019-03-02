param (
    [Parameter(Mandatory=$true)][string]$foldername
       )
$Games = Get-ChildItem -Path $folderName | where {$_.Extension -eq ".bin"}
foreach ($Game in $Games) {
#Create Cue variables
$CueName = $Game.BaseName + ".cue"
$CuePath = $folderName + "\" + $CueName  
#Check for existing cue file, If not found create, otherwise skip to next files
$FileExists = Test-Path $CuePath -PathType Leaf
If ($FileExists -eq $true) {
Write-host $CueName " Exists already."
}
Else
{
#File not found, create cue file.
Write-host "Creating Cue file for " $Game.BaseName
$CueText1 = "FILE " + '"' + $CueName + '"' + " BINARY"
$CueText2 = "  TRACK 01 MODE2/2352"
$CueText3 = "    INDEX 01 00:00:00"
New-Item $CuePath -ItemType File
Add-Content -Path $CuePath  $CueText1
Add-Content -Path $CuePath  $CueText2
Add-Content -Path $CuePath  $CueText3
}




}


#Add-Content -Path  


 