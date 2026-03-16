$reitings = 100

$status = Get-MpComputerStatus

if($status.RealTimeProtectionEnabled -eq $false) {
	$reitings -= 50
}

if($status.AntivirusSignatureAge -gt 3) {
	$reitings -= 20
}

if($status.QuickScanAge -gt 7) {
	$reitings -= 20
}

Write-Host "Sistemas drosibas reitings: $reitings / 100"
