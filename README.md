# nNGM Maps

This repository contains all the maps related to the nNGM project. The maps are written in the FHIR Mapping Language and are intended to run on the MappingEngine provided by Healex. 

The following transformations are included: 

- Clinical Documentation System -> FHIR
- FHIR -> Clinical Documentation System
- FileMaker -> FHIR
- Variant Call Format -> FHIR

## How to deploy

Run the 'deploy.ps1' Powershell script to upload all maps to a server of your choice. The script will ask you to enter your server's address and that's it.

**Two important notices:**

1. If you receive errors at the end of the script, these can be ignored as the StructureDefinitions are already present on the server in this case.

2. Currently, the nNGM maps are running on a custom version of the MappingEngine. They **will not work** with the default MappingEngine release.

## FHIR Profiles

The corresponding FHIR profiles can be found in these three projects: 

- [Antrag](https://simplifier.net/nngm-registration-form)
- [Befund](https://simplifier.net/nngm-molpatho-form)
- [Therapie](https://simplifier.net/nngm-therapy-form)