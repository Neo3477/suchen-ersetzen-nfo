##Skript um Textstellen in vielen Dateien zu ändern

#Pfad in dem die Dateien gescannt werden sollen, der Stern am Ende muss vorhanden sein
$ersetzungspfad = "C:\Users\Administrator\Desktop\test\Xnotar_dateien\*"

#Textpassagen die ersetzt werden sollen, kann beliebig erweitert werden 
$search = @("abc","123","xyz","456","def")
#Der Inhalt der die oben genannten Textpassagen überschreiben soll, ACHTUNG muss in gleicher Reihenfolge sein.
$replace = @("xxx","xxx","xxx","xxx","xxx")


#Abfrage ob du die Reihenfolgen richtig hast, hier kannst du prüfen ob alles korrekt ersetzt wird#

$i=0 #Hilfsvariable
foreach ($s in $search){ #Schleife die ausgibt, was mit welchem Wert ersetzt werden soll
    Write-Host "Du willst"$s "mit " $replace&#91;$i] " ersetzen"
    $i++}
$alles_korrekt = Read-Host -Prompt "Ist alles richtig? y/n" #Abfrage ob alles korrekt eingetragen wurde



################################### Der Ersetzungsvorgang ##########################################
 
$i=0 #Hilfsvariable
if($alles_korrekt -ieq "y"){ #wenn oben alles korrekt war und mit y geantwortet wurde beginnt der Vorgang
    foreach ($s in $search){
        Get-ChildItem -Path $ersetzungspfad -Include *.nfo,*.properties| Foreach-Object {Get-Content $_ | Out-String | Foreach-Object {$_.Replace($s,$replace&#91;$i])} | Set-Content $_}
        $i++}}