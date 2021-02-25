# Therapie CTS Transport -> FHIR Test

## Configuration:

# CDS -> FHIR:
* Vonk version: Vonk FHIR server 3.9.3
* Using Test Data/Antrag-CDS-Export.json and Test Data/2. Patient-FHIR-Bundle-2-Antrag.json

* Known issues: 
    * Patient (Todesdatum) was decidedly not mapped 

* Result: 
    * 1 error: slice by profile error by simplifier validator
    * 2 warnings: related to not finding loinc valuesets 

# FHIR -> CDS:
* Vonk version: Vonk FHIR server 3.9.0
* Using Test Data/3. Antrag-CDS-Export-Transformed.json and Test Data/2. Patient-FHIR-Bundle-2-Antrag.json

* Known Issues:
    * Todesdatum (Patient) is missing from each form (design choice) 