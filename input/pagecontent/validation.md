This is a UK supplement to [HL7 FHIR Validating Resources](https://www.hl7.org/fhir/stu3/validation.html) 

### Using the FHIR Validator

[Using the FHIR Validator](https://wiki.hl7.org/Using_the_FHIR_Validator). 

To validate against CareConnect resources you need to use this ImplementationGuide. This guide contains technical corrections to conformance resources held on the [HL7 UK Care Connect INTEROPen - Reference Server](https://fhir.hl7.org.uk/) 

#### Example 

To use this IG with the **FHIR Validator**  you need to specify **https://hl7-uk.github.io/UK-STU3** in the **-ig** parameter.
 
> java -jar org.hl7.fhir.validator.jar c:\temp\patient.xml -version 3.0 -ig https://hl7-uk.github.io/UK-STU3

If you wish to use a local copy of this IG's conformance resources they are available on [HL7 UK GitHib](https://github.com/HL7-UK/UK-STU3/tree/master/input/resources)

#### Terminology Support

By default, the terminology server used by the **FHIR Validator** is tx.fhir.org, which supports most terminologies.

The **FHIR Validator** does not currently work 100% with the [Beta Version - NHS Digital Ontology Server](https://ontoserver.dataproducts.nhs.uk/fhir/). Example   

> java -jar org.hl7.fhir.validator.jar c:\temp\patient.xml -version 3.0 -ig https://hl7-uk.github.io/UK-STU3 -tx https://ontoserver.dataproducts.nhs.uk/fhir/


### Asking a FHIR Server

The [operation validate](https://www.hl7.org/fhir/stu3/resource-operations.html#2.28.7.1) is supported by a number of servers. These include:

* [https://data.developer.nhs.uk/ccri-fhir/STU3/{Resource}/$validate](https://data.developer.nhs.uk/ccri-fhir/STU3/[Resource]/$validate) - resource must be specified
* [https://fhir.airelogic.com/ccri-fhir/STU3/{Resource}/$validate](https://fhir.airelogic.com/ccri-fhir/STU3/[Resource]/$validate) - resource is optional, this server also supports the profile parameter.

Both servers will validate against Care Connect Profiles, CodeSystems and ValueSets. The AireLogic server uses [Beta Version - NHS Digital Ontology Server](https://ontoserver.dataproducts.nhs.uk/fhir/) for terminology verification.  
The code for both FHIR servers can be found on the [Care Connect Reference Implementation GitHub Repository](https://github.com/nhsconnect/careconnect-reference-implementation)

#### Example 

Validate a (GP Connect) Patient against the Care Connect patient profile using POST directly. 

Request:

```
POST https://fhir.airelogic.com/ccri-fhir/STU3/$validate?profile=https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Patient-1
Content-Type application/fhir+json
[other headers]
```
Body:
```json
{
  "resourceType": "Patient",
  "id": "2",
  "meta": {
    "versionId": "1469448000000",
    "profile": [
      "https://fhir.nhs.uk/STU3/StructureDefinition/CareConnect-GPC-Patient-1"
    ]
  },
  "extension": [
    {
      "url": "https://fhir.nhs.uk/STU3/StructureDefinition/Extension-CareConnect-GPC-RegistrationDetails-1",
      "extension": [
        {
          "url": "preferredBranchSurgery",
          "valueReference": {
            "reference": "Location/785b4ff5-aced-4bdf-b7ed-34f92131ce97"
          }
        }
      ]
    },
    {
      "url": "https://fhir.nhs.uk/STU3/StructureDefinition/Extension-CareConnect-GPC-NHSCommunication-1",
      "extension": [
        {
          "url": "language",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "https://fhir.nhs.uk/STU3/CodeSystem/CareConnect-HumanLanguage-1",
                "code": "bn",
                "display": "Bengali"
              }
            ]
          }
        },
        {
          "url": "interpreterRequired",
          "valueBoolean": false
        }
      ]
    }
  ],
  "identifier": [
    {
      "extension": [
        {
          "url": "https://fhir.nhs.uk/STU3/StructureDefinition/Extension-CareConnect-GPC-NHSNumberVerificationStatus-1",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "https://fhir.nhs.uk/CareConnect-NHSNumberVerificationStatus-1",
                "code": "01",
                "display": "Number present and verified"
              }
            ]
          }
        }
      ],
      "system": "https://fhir.nhs.uk/Id/nhs-number",
      "value": "9476719931"
    }
  ],
  "active": true,
  "name": [
    {
      "use": "official",
      "text": "JACKSON Jane (Miss)",
      "family": "Jackson",
      "given": [
        "Jane"
      ],
      "prefix": [
        "Miss"
      ]
    }
  ],
  "telecom": [
    {
      "system": "phone",
      "value": "01454587554",
      "use": "home"
    }
  ],
  "gender": "female",
  "birthDate": "1952-05-31",
  "address": [
    {
      "use": "home",
      "type": "physical",
      "line": [
          "Trevelyan Square",
          "Boar Ln"
      ],
      "city": "Leeds",
      "district": "West Yorkshire",
      "postalCode": "LS1 6AE"
    }
  ],
  "managingOrganization": {
    "reference": "Organization/14"
  }
}
```

### Online Validation

Alternatively you may validate resources using an online validation application. Validators include:

* [AireLogic FHIR Validator](https://fhir.airelogic.com/)
* [Care Connect Reference Implementation FHIR Validation](https://data.developer.nhs.uk/ccri/term/validate)  