# Antrag CTS Transport -> FHIR Test

## Configuration:

# CDS -> FHIR:
* Vonk version: Vonk FHIR server 3.9.3
* Using Test Data/Antrag-CDS-Export.json and Test Data/2. Patient-FHIR-Bundle-2-Antrag.json
* Result: 
    * 2 errors: 
        * *Internal logic failure: Unknown symbol 'resolve' at Bundle.entry[0].resource[0].entry[0].resource[0].section[0]*
    * 2 warnings: 
        * NotSupported : Terminology service failed while validating code '' (system ''): Cannot retrieve valueset 'http://loinc.org/vs/LL529-9'


# FHIR -> CDS:
* Vonk version: Vonk FHIR server 3.9.3
* Using Test Data/3. Antrag-CDS-Export-Transformed.json and Test Data/2. Patient-FHIR-Bundle-2-Antrag.json
* Result: 
    * Import pipeline broken, need to access forms directly by their crfids.
    * Everything appears to be correctly filled in in the individual forms.