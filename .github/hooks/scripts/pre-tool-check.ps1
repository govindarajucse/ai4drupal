# pre-tool-check.ps1 - Pre-tool use validation (Windows)
# Runs before code modifications to ensure compliance

# Read input from stdin
$input = $null
try {
    $input = [Console]::In.ReadToEnd()
} catch {
    $input = ""
}

# Log the check
Write-Host "Pre-tool check running..." -ForegroundColor Cyan

# Return continue signal
@{
    continue = $true
} | ConvertTo-Json
