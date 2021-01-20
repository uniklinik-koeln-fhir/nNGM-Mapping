# Read server address and build url
$server = Read-Host "Enter server url without a trailing slash"
$url = -join($server, '/administration/$convert?persist=true')

# Get all files
$files = Get-ChildItem -Path .\ -Filter *.map -Recurse -File -Name| ForEach-Object {[System.IO.Path]::GetFullPath($_)}

# Set headers
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "text/fhir-mapping; charset=utf-8; fhirVersion=4.0")
$headers.Add("Accept", "application/fhir+json; fhirVersion=4.0")

# Loop over files
foreach ($file in $files) {
    Write-Output -join("Converting: ", $file, $url)
    $body = (Get-Content -Path ".\CDS Maps\nNGM-CDS-to-FHIR-Master.map" | out-string)
    $response = Invoke-RestMethod 'http://localhost:4080/administration/$convert?persist=true' -Method 'POST' -Headers $headers -Body $body
    $response | ConvertTo-Json
}

# http://localhost:4080