$apps = winget list --source msstore 2>$null | Select-Object -Skip 1
$count = ($apps | Where-Object { $_.Trim() -ne "" }).Count

Write-Output "Sistēmā ir instalētas [$count] aplikācijas no Microsoft Store."
