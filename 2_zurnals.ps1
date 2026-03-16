$failaCels = "$env:USERPROFILE/Documents/Warnings.txt"

$noDatuma = (Get-Date).AddDays(-3)

$notikumi = Get-EventLog -LogName Application -EntryType Warning -After $noDatuma

$topAvoti = $notikumi |
Group-Object Source |
Sort-Object Count -Descending |
Select-Object -First 3

$rezultats = @()
$rezultats += "Bridinajumi pedejo 3 dienu laika"
$rezultats += "--------------------------------"
$rezultats += ""

$rezultats += "Top 3 avoti:"
foreach ($avots in $topAvoti) {
	$rezultats += "$($avots.Name) - $($avots.Count)"
}

$rezultats | Out-File -Filepath $failaCels -Encoding UTF8
Write-Host "Rezultats saglabats $failaCels"

