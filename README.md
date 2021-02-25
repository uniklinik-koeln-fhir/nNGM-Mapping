# CDS <-> FHIR nNGM maps

This repository contains the CDS to FHIR and FHIR to CDS maps that cover the nNGM forms. 

## How to deploy

Run the 'deploy.ps1' Powershell script to upload all maps to a server of your choice. The script will ask you to enter your server's address. 

In case you receive an error on the last POST of the Script, simply ignore it. That is Vonk telling you it already has the same StructureDefinition present.