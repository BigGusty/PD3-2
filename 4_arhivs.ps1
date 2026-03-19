$downloadsPath = Join-Path $env:USERPROFILE "Downloads"
$documentsPath = Join-Path $env:USERPROFILE "Documents"
$zipPath = Join-Path $documentsPath "PDF_Backup.zip"

$timeLimit = (Get-Date).AddHours(-48)

$pdfFiles = Get-ChildItem -Path $downloadsPath -Filter *.pdf -Recurse |
	Where-Object { $_.LastWriteTime -ge $timeLimit }

if ($pdfFiles.Count -gt 0) {
	Compress-Archive -Path $pdfFiles.FullName -DestinationPath $zipPath -Force
}