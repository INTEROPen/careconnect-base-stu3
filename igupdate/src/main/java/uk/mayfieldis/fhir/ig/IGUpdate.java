package uk.mayfieldis.fhir.ig;

import ca.uhn.fhir.context.FhirContext;
import ca.uhn.fhir.rest.api.EncodingEnum;

import ca.uhn.fhir.rest.client.api.IGenericClient;
import org.hl7.fhir.convertors.VersionConvertor_30_40;
import org.hl7.fhir.dstu3.model.*;
import org.hl7.fhir.r4.model.ImplementationGuide;
import org.hl7.fhir.r4.model.Reference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Map;
import java.util.SortedSet;
import java.util.TreeSet;


@SpringBootApplication
public class IGUpdate implements CommandLineRunner {

    private static Logger log = LoggerFactory
            .getLogger(IGUpdate.class);

    FhirContext ctxSTU3 = FhirContext.forDstu3();
    FhirContext ctxR4 = FhirContext.forR4();

    VersionConvertor_30_40 convertor = new VersionConvertor_30_40();

    String path = "C:\\Development\\Wildfyre\\UK-STU3\\input\\resources\\";
    String igPath = path + "UK-STU3-ImplementationGuide.xml";

    ImplementationGuide ig;

    private IGenericClient validationClient;

    public static void main(String[] args) {
        log.info("STARTING THE APPLICATION");
        SpringApplication.run(IGUpdate.class, args);
        log.info("APPLICATION FINISHED");
    }

    @Override
    public void run(String... args) {
        log.info("EXECUTING : command line runner");

        for (int i = 0; i < args.length; ++i) {
            log.info("args[{}]: {}", i, args[i]);
        }

        try {
            String igGuide = Files.readString(Paths.get(igPath));
            ig = (ImplementationGuide) ctxR4.newXmlParser().parseResource(igGuide);
        } catch (IOException e) {
            e.printStackTrace();
        }

        this.validationClient = ctxSTU3.newRestfulGenericClient("https://fhir.airelogic.com/ccri-fhir/STU3");
        this.validationClient.setEncoding(EncodingEnum.JSON);

        HL7UKResources();

        String igGuide = ctxR4.newXmlParser().setPrettyPrint(true).encodeResourceToString(ig);

        System.out.println(igGuide);

        try {
            Files.writeString(Paths.get(igPath),igGuide);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void HL7UKResources() {
        String groupPrefix = "uk-";
        checkGrouping(groupPrefix+"1","HL7 UK Base","UK Base FHIR Profiles");
        checkGrouping(groupPrefix+"2","HL7 UK Level 3","UK Level 3 FHIR Profiles");
        checkGrouping(groupPrefix+"3","HL7 UK Base Extensions","UK Base FHIR Extensions");
        checkGrouping(groupPrefix+"4","HL7 UK ValueSets","UK FHIR ValueSets");
        checkGrouping(groupPrefix+"5","HL7 UK CodeSystems","UK FHIR CodesSystems");

        ProcessReferenceServer processReferenceServer = new ProcessReferenceServer("https://fhir.hl7.org.uk/STU3/");
        processReferenceServer.populateMap();

        processMap(processReferenceServer.getResources(),groupPrefix);
    }

    private void processMap(Map<String, Resource> map, String groupId) {

        SortedSet<String> keys = new TreeSet<>(map.keySet());
        for (String key : keys) {

            Resource resource = map.get(key);

            String content = ctxSTU3.newXmlParser().setPrettyPrint(true).encodeResourceToString(resource);
            try {
                if (convertsToR5(resource)  && validatesOK(resource)) {
                    String filename = resource.getIdElement().getIdPart();
                    if (resource instanceof ValueSet || resource instanceof CodeSystem) {
                        filename = resource.getResourceType().name() + "\\" + filename;
                    }

                    if (filename !=null) {
                        Files.writeString(Paths.get(path + filename + ".xml"), content);
                        checkInIG(resource, key, groupId);
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    private void checkGrouping(String groupId, String group, String groupDesc) {
        ImplementationGuide.ImplementationGuideDefinitionGroupingComponent groupFound = null;
        for (ImplementationGuide.ImplementationGuideDefinitionGroupingComponent groupsearch : ig.getDefinition().getGrouping()) {
            if (groupsearch.getName().equals(group)) {
                groupFound = groupsearch;
                break;
            }
        }
        if (groupFound == null) {
            groupFound = new ImplementationGuide.ImplementationGuideDefinitionGroupingComponent();
            groupFound.setId(groupId);
            groupFound.setDescription(groupDesc);
            groupFound.setName(group);
            ig.getDefinition().addGrouping(groupFound);
        }
    }
    private void checkInIG(Resource resource, String name, String groupPrefix) {
        ImplementationGuide.ImplementationGuideDefinitionResourceComponent resourceComponent = null;

        for(ImplementationGuide.ImplementationGuideDefinitionResourceComponent resourceComponentSearch : ig.getDefinition().getResource()) {
            if (resourceComponentSearch.getName().equals(name)) resourceComponent = resourceComponentSearch;
        }

        String reference = name.replace("cs-","").replace("vs-","");
        if (resourceComponent == null) {
            resourceComponent = new ImplementationGuide.ImplementationGuideDefinitionResourceComponent();
            resourceComponent.setName(name);

            ig.getDefinition().addResource(resourceComponent);
        }
        resourceComponent.setReference(
                new Reference()
                        .setReference(resource.getResourceType().name()+"/"+resource.getIdElement().getIdPart()));
        if (resource instanceof ValueSet) {
            resourceComponent.setGroupingId(groupPrefix+"4");
        } else if (resource instanceof CodeSystem) {
            resourceComponent.setGroupingId(groupPrefix+"5");
        } else if (resource.getIdElement().getIdPart().startsWith("Extension")) {
            resourceComponent.setGroupingId(groupPrefix+"3");
        } else if (resource.getIdElement().getIdPart().split("-").length == 4) {
            resourceComponent.setGroupingId(groupPrefix+"2");
        } else {
            resourceComponent.setGroupingId(groupPrefix+"1");
        }


    }

    private Boolean validatesOK(Resource resource) {
        return true;
    }

     /*   Parameters parameters = new Parameters();

        parameters.set addParameter().setName("resource").setResource(resource);

        Parameters output = validationClient.operation()
                .onServer().named("validate")
               // .withParameters(parameters)
                .withNoParameters()
                .
                .returnResourceType(org.hl7.fhir.dstu3.model.Parameters.class)
                .execute();

        if (output.hasParameter()) {

        }
        return true;
    }

      */


    private Boolean convertsToR5(Resource resource) {
        if (resource.getId() == null || resource.getId().isEmpty()) log.error("Missing Id {}",resource.getResourceType());
        org.hl7.fhir.dstu3.model.Resource resourceR3 = (Resource) resource;
        org.hl7.fhir.r4.model.Resource resourceR5 = convertor.convertResource(resourceR3,false);

        if (resourceR5 != null) return true;
        return false;
    }

}
