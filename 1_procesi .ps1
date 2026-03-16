$limits = 150MB

$failaCels = "$env:USERPROFILE/Documents/LielieProcesi.csv"

Get-Process |
Where-Object {
	$_.WorkingSet -gt $limits -and $_.Name -
