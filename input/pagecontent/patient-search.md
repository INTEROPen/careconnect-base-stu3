
## 1. Overview ##



Most NHS trusts will typically have one central system  called the Patient Administration System (PAS) thats holds a master Patient registry of all patients who have had care with the trust. In order to reduce patient administration and improve data quality, all  other MIS within the trusts will be kept in sync with the central registry (PAS) via HL7v2 [messaging](http://www.enterpriseintegrationpatterns.com/patterns/messaging/Messaging.html). Alongside these messages will be patient encounter messages as shown in the diagram below:

![Patient Identity Feeds](images/Iti_pam_ip.jpg)

[HL7v2](https://isd.digital.nhs.uk/trud3/user/guest/group/0/pack/1/subpack/200/releases) is a mature and widely used standard but it is awkward to use forr querying patient demographic details (see HL7v2 Patient Demographics Query below). Mostly because it is a messaging standard and not an API. Care Connect API gives an API using [RESTful](https://en.wikipedia.org/wiki/Representational_state_transfer) interface following a [resource API pattern](http://www.servicedesignpatterns.com/WebServiceAPIStyles/ResourceAPI) to provide access to the central Patient repository.
This is particularly suited to:
* A health portal securely exposing demographics data to browser based plugins
* Medical devices which need to access patient demographic information
* Mobile devices used by physicians (example bedside eCharts) which need to establish
patient context by scanning a bracelet
* Web based EPR/EHR applications which wish to provide dynamic updates of patient
demographic information such as a non-postback search, additional demographic detail,
etc.
* Any low resource application which exposes patient demographic search functionality
* A facade providing a simple API to a complex interface

## Client Patient Search ##

### Postman Patient Search ###

![Patient Search FHIR Actor Diagram](images/PDQ Actor Diagram.jpg)

The patient search can use any of the search parameters defined in the [Patient](api_entity_patient.html) API. For example if the patient informs the nurse of their date of birth and part of the name (i.e. 19th Mar 1998 and Bernie) and surname the query would be.

```
GET [baseUrl]/Patient?birthdate=1998-03-13&name=bernie
```

`[baseUrl]` needs to be replaced with an actual url, in the example below this is `https://data.developer.nhs.uk/ccri/STU3`. The url would work within a web browser but a better tool to work with RESTful is [Postman](https://www.getpostman.com/)

```
https://data.developer.nhs.uk/ccri/STU3/Patient?birthdate=1998-03-13&name=bernie
```

A sample response is shown below

#### XML Example - Bundle Patient ####

TODO Add in example here

What we have just described is shown in the diagram below. When entered the url we did a Patient Search FHIR Query and the response is called Patient Search FHIR Query Response.

![Basic Process Flow](images/Basic Process Flow PDQm.jpg)

ManagagingOrganisation, the patients GP Practice is given as a reference (Organization/24965)

```xml
<managingOrganization>
    <reference value="Organization/1"/>
    <display value="Moir Medical Centre"/>
</managingOrganization>
```

If you wish to know more details about this organisation, you will need to follow the reference. The Reference used in the the example is relative, they can also point to external servers, e.g.:

```xml
<managingOrganization>
    <reference value="https://data.developer.nhs.uk/ccri/STU3/Organization/1"/>
    <display value="Moir Medical Centre"/>
</managingOrganization>
```

We retrieve the Organization resource in the similar manner to searching for the Patient but as we know the `Id` of the resource we can access it directly.

```
GET [baseUrl]/Organization/1
```

The response from this request is shown below, it is not returned in a FHIR [Bundle](http://www.hl7.org/fhir/bundle.html) as we haven't performed a search and instead requested the resource by it's Id. The SDS/ODS code can be found in the identifier section.

#### XML Example - Organization ####

[Organisation Example](organization-3.html)

The method for returning Practitioner is the similar and an example is shown below in section 2.2

### Patient Search using NHS Number or PAS Number ###

To find a patient by NHS number, Hospital number, etc we use the identifier. The earlier example contained an NHS number, the number 9876543210 belongs to the system `https://fhir.nhs.uk/Id/nhs-number`, which is identifier for the NHS Number in England and Wales.

```xml
<identifier>
    <extension url="https://fhir.hl7.org.uk/StructureDefinition/Extension-CareConnect-NHSNumberVerificationStatus-1">
        ... snip ...
    </extension>
    <system value="https://fhir.nhs.uk/Id/nhs-number"/>
    <value value="9876543210"/>
</identifier>
```

To search for Patients by NHS number, use the following query:

```
GET [baseUrl]/Patient?identifier=[system]|[code]
```

The system is `https://fhir.nhs.uk/Id/nhs-number` and the code is `9876543210`, e.g.

```
GET [baseUrl]/Patient?identifier=https://fhir.nhs.uk/Id/nhs-number|9876543210
```

This will return all Patient resources with a NHS number of 9876543210 (this may be more than one). NHS Number may not be the main patient identifier within a NHS Organisation or Health Enterprise, this is for a number of reasons:
* Patient doesn't currently have a NHS Number (foreign visitor or from another home nation in the UK)
* Patient's NHS number hasn't been validated (and so can not be used for interoperability/communication)
* Patient has not been identified accurately.

For these reasons the trust/health organisation will use it's own primary identifier, often referred to as Hospital or District number. Organisation's will need to create their own system for the identifier, in the example Example NHS Trust have used 'https://fhir.example.nhs.uk/PAS/Patient' to indicate PAS Hospital Number. They use this with the API as shown below:

```
GET [baseUrl]/Patient?identifier=https://fhir.example.nhs.uk/PAS/Patient|123345
```


### Java Example ###

The examples are built using [HAPI FHIR](http://hapifhir.io/) which is an open source implementation of the HL7 FHIR specification by the University Health Network, Canada. The source code can be found on [NHSConnect GitHub - hapi-patient-find-example-one](https://github.com/nhsconnect/careconnect-examples/tree/master/hapi-patient-find-example-one)

Firstly we need to setup the HAPI client which includes setting a FHIR context and setting the endpoint server.

```java

// Create a FHIR Context

     FhirContext ctx = FhirContext.forDstu3();
     IParser parser = ctx.newXmlParser();

// Create a client and post the transaction to the server

     IGenericClient client = ctx.newRestfulGenericClient("https://data.developer.nhs.uk/ccri/STU3/");

```

Next we need to specify the search parameters, as we mentioned in the earlier section the results from a search will be returned as Bundle.

```java

     Bundle results = client
                .search()
                .forResource(Patient.class)
                .where(Patient.IDENTIFIER.exactly().systemAndCode("https://fhir.nhs.uk/Id/nhs-number", "9876543210"))
                .returnBundle(Bundle.class)
                .execute();

```

We now have references to the Patient Practice and GP. The method of retrieving these is the same as we did earlier with postman.

```java

for (Bundle.BundleEntryComponent entry : results.getEntry()) {

    if (entry.getResource() instanceof Patient) {
        Patient patient = (Patient) entry.getResource();

        // Retrieve the Practice

        if (patient.getManagingOrganization() != null) {

            Organization surgery = client
                    .read()
                    .resource(Organization.class)
                    .withId(patient.getManagingOrganization().getReference())
                    .execute();

            System.out.println(parser.setPrettyPrint(true).encodeResourceToString(surgery));
        }

        // Retrieve the GP

        if (patient.getGeneralPractitioner().size() > 0) {

            Practitioner gp = client
                    .read()
                    .resource(Practitioner.class)
                    .withId(patient.getGeneralPractitioner().get(0).getReference())
                    .execute();

            System.out.println(parser.setPrettyPrint(true).encodeResourceToString(gp));
        }
    }

}

```
