# ---------------------------- Functions ----------------------------
function Send-FilesToFhirServer {
    param (
        $Files,
        $Url,
        $ContentType
    )
    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Content-Type", $ContentType)
    $headers.Add("Accept", "application/fhir+json; fhirVersion=4.0")

    # Loop over files
    foreach ($file in $Files) {
        $file
        $body = (Get-Content -Path $file | out-string)
        $response = Invoke-WebRequest $Url -Method 'POST' -Headers $Headers -Body $body
        $response | Select-Object -Expand StatusCode
    }
}

# ---------------------------- Read FHIR server address ----------------------------
$server = Read-Host "Enter server url without a trailing slash"

# ---------------------------- Post all maps to server ----------------------------
$convertUrl = -join($server, '/administration/$convert?persist=true')

# Get all maps
$files = Get-ChildItem .\ -Filter *.map -Recurse | % { $_.FullName }

# Send maps
Send-FilesToFhirServer -Files $files -Url $convertUrl -ContentType "text/fhir-mapping; charset=utf-8; fhirVersion=4.0"

# ---------------------------- Post all StructureDefinitions to server ----------------------------
$postSdUrl = -join($server, '/administration/StructureDefinition')

# Get all StructureDefinitions
$files = Get-ChildItem .\StructureDefinitions -Filter *.json -Recurse | % { $_.FullName }

# Send StructureDefinitions to server
Send-FilesToFhirServer -Files $files -Url $postSdUrl -Headers $headers -ContentType "application/fhir+json; fhirVersion=4.0"

"------------------ Running Tests --------------"

# ---------------------------- Run test CDS -> FHIR ----------------------------
#$transformUrl = -join($server, '/administration/StructureMap/nNGM_Mapping_CdsToFhir_Master/$transform')

# Get all StructureDefinitions
#$testData = Get-ChildItem .\TestData\* -Filter 2.* -Recurse | % { $_.FullName }

#Send-FilesToFhirServer -Files $testData -Url $transformUrl -Headers $headers -ContentType "application/fhir+json; fhirVersion=4.0"


# http://localhost:4080