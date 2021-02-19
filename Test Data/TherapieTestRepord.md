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
    * Todesdatum (Patient) is missing from each form (design choice) 
    * Strahlentherapie -> Ende der Bestrahlung doesn’t support multiple choices in mapping, but form does for some reason. In reverse map only 1 value can be selected 
    * Systemische Therapie -> Extension(Date) needed for Datum Aenderung (id_1465)
    * Systemische Therapie Neues therapieschema medicationCodeableConcept overwrites Therapieschema medicationCodeableConcept, unclear if both should be stored (would require extension on medicationCodeableConcept)