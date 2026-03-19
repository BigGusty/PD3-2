$limits = 150MB
$failaCels = "$env:USERPROFILE/Documents/LielieProcesi.csv"

Get-Process |
Where-Object {
	$_.WorkingSet -gt $limits -and $_.Name -ne "msedge"
} |
Select-Object Name, Id, WorkingSet |
Export-Csv -Path $failacels -NoTypeInformation -Encoding UTF8

Write-Host "Procesu saraksts saglabāts $failaCels"
