# Skript um Textstellen in vielen Dateien zu ändern

# Pfad in dem die Dateien gescannt werden sollen, der Stern am Ende muss vorhanden sein

$ersetzungspfad = "D:\Filme\*"

$search = @("<trailer>\\MARCO-PC\Filme3\")

$replace = @("<trailer>\\Synology\Test\")


$i=0 
foreach ($s in $search){
    Get-ChildItem -Path $ersetzungspfad -Recurse -Include *.nfo,*.properties| Foreach-Object {Get-Content $_ | Out-String | Foreach-Object {$_.Replace($s,$replace)} | Set-Content $_}
    $i++
}