package uk.mayfieldis.fhir.ig;

import ca.uhn.fhir.context.FhirContext;
import org.hl7.fhir.dstu3.model.Resource;
import org.hl7.fhir.dstu3.model.StructureDefinition;
import org.hl7.fhir.r5.model.ImplementationGuide;
import org.hl7.fhir.r5.model.Reference;
import org.hl7.fhir.dstu3.model.ValueSet;
import org.hl7.fhir.dstu3.model.CodeSystem;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Collection;


@SpringBootApplication
public class IGUpdate implements CommandLineRunner {

    private static Logger LOG = LoggerFactory
            .getLogger(IGUpdate.class);

    FhirContext ctxSTU3 = FhirContext.forDstu3();
    FhirContext ctxR5 = FhirContext.forR5();

    String path = "C:\\Development\\Wildfyre\\UK-STU3\\input\\resources\\";
    String igPath = "C:\\Development\\Wildfyre\\UK-STU3\\input\\UK-STU3-ImplementationGuide.xml";

    ImplementationGuide ig;

    public static void main(String[] args) {
        LOG.info("STARTING THE APPLICATION");
        SpringApplication.run(IGUpdate.class, args);
        LOG.info("APPLICATION FINISHED");
    }

    @Override
    public void run(String... args) {
        LOG.info("EXECUTING : command line runner");

        for (int i = 0; i < args.length; ++i) {
            LOG.info("args[{}]: {}", i, args[i]);
        }

        try {
            String igGuide = Files.readString(Paths.get(igPath));
            ig = (ImplementationGuide) ctxR5.newXmlParser().parseResource(igGuide);
        } catch (IOException e) {
            e.printStackTrace();
        }

        HL7UKResources();

        String igGuide = ctxR5.newXmlParser().setPrettyPrint(true).encodeResourceToString(ig);

        System.out.println(igGuide);

        try {
            Files.writeString(Paths.get(igPath),igGuide);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void HL7UKResources() {
        checkGrouping("HL7 UK","Core UK FHIR Resources");

        ProcessReferenceServer processReferenceServer = new ProcessReferenceServer("https://fhir.hl7.org.uk/STU3/", "HL7 UK");
        Collection<StructureDefinition> structs = processReferenceServer.getStructureDefinitions();
        Collection<CodeSystem> codeSystems = processReferenceServer.getCodeSystems();
        Collection<ValueSet> valueSets =
                processReferenceServer.getValueSets();

        processSD(structs,"HL7 UK");
        processCS(codeSystems,"HL7 UK");
        processVS(valueSets,"HL7 UK");
    }

    private void processSD(Collection<StructureDefinition> structs, String group) {
        for (StructureDefinition sd : structs) {

            String[] split = sd.getUrl().split("/");
            String resourceName = split[split.length-1] ;
            String content = ctxSTU3.newXmlParser().encodeResourceToString(sd);
            try {
                Files.writeString(Paths.get(path +resourceName +".xml"), content);
                checkInIG(sd, resourceName, group);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void processVS(Collection<ValueSet> valueSets, String group) {
        for (ValueSet vs : valueSets) {

            String[] split = vs.getUrl().split("/");
            String resourceName = split[split.length-1] ;
            String content = ctxSTU3.newXmlParser().encodeResourceToString(vs);
            try {
                Files.writeString(Paths.get(path + "ValueSet\\"+resourceName +".xml"), content);
                checkInIG(vs, resourceName, group);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void processCS(Collection<CodeSystem> codeSystems, String group) {
        for (CodeSystem cs : codeSystems) {

            String[] split = cs.getUrl().split("/");
            String resourceName = split[split.length-1] ;
            String content = ctxSTU3.newXmlParser().encodeResourceToString(cs);
            try {
                Files.writeString(Paths.get(path + "CodeSystem\\"+resourceName +".xml"), content);
                checkInIG(cs, resourceName, group);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void checkGrouping(String group, String groupDesc) {
        ImplementationGuide.ImplementationGuideDefinitionGroupingComponent groupFound = null;
        for (ImplementationGuide.ImplementationGuideDefinitionGroupingComponent groupsearch : ig.getDefinition().getGrouping()) {
            if (groupsearch.getName().equals(group)) {
                groupFound = groupsearch;
                break;
            }
        }
        if (groupFound == null) {
            groupFound = new ImplementationGuide.ImplementationGuideDefinitionGroupingComponent();
            groupFound.setDescription(groupDesc);
            groupFound.setName(group);
            ig.getDefinition().addGrouping(groupFound);
        }
    }
    private void checkInIG(Resource resource, String name, String group) {
        ImplementationGuide.ImplementationGuideDefinitionResourceComponent resourceComponent = null;
        for(ImplementationGuide.ImplementationGuideDefinitionResourceComponent resourceComponentSearch : ig.getDefinition().getResource()) {
            if (resourceComponentSearch.getName().equals(name)) resourceComponent = resourceComponentSearch;
        }

        if (resourceComponent == null) {
            resourceComponent = new ImplementationGuide.ImplementationGuideDefinitionResourceComponent();
            resourceComponent.setName(name);
            resourceComponent.setReference(new Reference().setReference(resource.getResourceType().name()+"/"+name));

            ig.getDefinition().addResource(resourceComponent);
        }
        resourceComponent.setGroupingId(group);
    }

}
