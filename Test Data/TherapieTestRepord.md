# Therapie CTS Transport -> FHIR Test

## Configuration:

# CDS -> FHIR:
* Vonk version: Vonk FHIR server 3.9.3
* Using Test Data/Antrag-CDS-Export.json and Test Data/2. Patient-FHIR-Bundle-2-Antrag.json

* Known issues: 
    * Patient (Todesdatum) was decidedly not mapped 
    * Operation -> Resectionsstatus/Art der resection  not mapping: should be inside same extension[] scope as resectionsart, currently not possible due to collate bug

* Result: 
    * 1 error: slice by profile error by simplifier validator
    * 2 warnings: related to not  finding loinc valuesets

# FHIR -> CDS:
* Vonk version: Vonk FHIR server 3.9.3
* Using Test Data/3. Antrag-CDS-Export-Transformed.json and Test Data/2. Patient-FHIR-Bundle-2-Antrag.json

* Known Issues:
    * Systemische Therapie output is present 4 times, does not appear to influence the import
    * Strahlentherapie output is present 2 times, does not appear to influence the import
    * Todesdatum (Patient) is missing from each form by decision 
    * Operation -> ResectionStatus/Art der resection would map but is not present in generated FHIR bundles (see cds -> FHIR known issues)
    * Strahlentherapie -> Ende der Bestrahlung doesn’t support multiple choices in mapping, but form does for some reason. In reverse map only 1 value can be selected 
    * Systemische Therapie -> When Datum anderung (1465) is present in export, thereapie begin (1246) and ende (1247) are not mapped even if they are mapped to different target fields
    * Systemische Therapie Neues therapieschema medicationCodeableConcept overwrites Therapieschema medicationCodeableConcept, unclear if both should be stored (would require extension on medicationCodeableConcept)