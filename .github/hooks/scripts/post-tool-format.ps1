# post-tool-format.ps1 - Post-tool use formatting (Windows)
# Runs after code modifications to auto-format

# Read input from stdin
$input = $null
try {
    $input = [Console]::In.ReadToEnd()
} catch {
    $input = ""
}

# Check if PHPCBF is available
$phpcbf = Get-Command phpcbf -ErrorAction SilentlyContinue

if ($phpcbf) {
    # Try to extract file path from input
    if ($input -match '"filePath":"([^"]+)"') {
        $filePath = $matches[1]
        
        # Check if it's a PHP file
        if ($filePath -match '\.(php|module|inc|install|theme)$') {
            try {
                & phpcbf --standard=Drupal $filePath 2>$null
                Write-Host "Auto-formatted: $filePath" -ForegroundColor Green
            } catch {
                # Ignore formatting errors
            }
        }
    }
}

# Return continue signal
@{
    continue = $true
} | ConvertTo-Json
