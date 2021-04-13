##Skript um Textstellen in vielen Dateien zu ändern

#Pfad in dem die Dateien gescannt werden sollen, der Stern am Ende muss vorhanden sein

$ersetzungspfad = "D:\Filme\1917\*"

#Textpassagen die ersetzt werden sollen, kann beliebig erweitert werden 

$search = @("<trailer>\\MARCO-PC\Filme3\"<#,"<trailer>\\HOMESERVER\Filme\"#>)
#Der Inhalt der die oben genannten Textpassagen überschreiben soll, ACHTUNG muss in gleicher Reihenfolge sein.

$replace = @("<trailer>\\MARCO-PC\Test\"<#,"<trailer>\\HOMESERVER\TEST\"#>)


$i=0 
foreach ($s in $search){
    Get-ChildItem -Path $ersetzungspfad -Include *.nfo,*.properties| Foreach-Object {Get-Content $_ | Out-String | Foreach-Object {$_.Replace($s,$replace)} | Set-Content $_}
    $i++
}