    package uk.mayfieldis.fhir.ig;

import ca.uhn.fhir.context.FhirContext;
import ca.uhn.fhir.rest.api.EncodingEnum;
import ca.uhn.fhir.rest.client.api.IGenericClient;
import org.hl7.fhir.dstu3.model.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.*;

public class ProcessReferenceServer {

    private String serverUrl;
    private String group;

    private Map<String, ValueSet> valueSets =  new HashMap<>();
    private Map<String, CodeSystem> codeSystems =  new HashMap<>();
    private Map<String, StructureDefinition> structureDefinitions =  new HashMap<>();

    private IGenericClient client;

    FhirContext ctxFHIR = FhirContext.forDstu3();

    private static Logger log = LoggerFactory
            .getLogger(ProcessReferenceServer.class);

    public ProcessReferenceServer(String _serverUrl, String _group) {
        this.serverUrl = _serverUrl;
        this.group = _group;

        this.client = ctxFHIR.newRestfulGenericClient(serverUrl);
        this.client.setEncoding(EncodingEnum.JSON);
    }

    public Collection<StructureDefinition> getStructureDefinitions() {

        Bundle bundle = null;
        try {
            bundle = client.search()
                    .forResource(StructureDefinition.class)
                    .returnBundle(Bundle.class)
                    .execute();
        } catch (Exception ex1) {
            log.error(ex1.getMessage());
        }

        if (bundle != null && bundle.hasEntry()) {
            Boolean more;
            do {
                more=false;
                for (Bundle.BundleEntryComponent entry : bundle.getEntry()) {
                    log.info(entry.getFullUrl());
                    log.info(entry.getFullUrl());
                    if (entry.getResource() instanceof StructureDefinition) {
                        StructureDefinition sd = (StructureDefinition) entry.getResource();
                        this.structureDefinitions.put(sd.getUrl(),sd);
                    }
                }
                if (bundle.getLink(Bundle.LINK_NEXT) != null) {
                    // load next page
                    log.info(bundle.getLink(Bundle.LINK_NEXT).getUrl());
                    try {
                        bundle = client.loadPage().next(bundle).execute();
                        more = true;
                    } catch (Exception ex) {
                        log.error(ex.getMessage());
                        more= false;
                    }
                }
            } while (more);
        }
        return structureDefinitions.values();
    }
    public Collection<CodeSystem> getCodeSystems() {

        Bundle bundle = null;
        try {
            bundle = client.search()
                    .forResource(CodeSystem.class)
                    .returnBundle(Bundle.class)
                    .execute();
        } catch (Exception ex1) {
            log.error(ex1.getMessage());
        }

        if (bundle != null && bundle.hasEntry()) {
            Boolean more;
            do {
                more=false;
                for (Bundle.BundleEntryComponent entry : bundle.getEntry()) {
                    log.info(entry.getFullUrl());
                    log.info(entry.getFullUrl());
                    if (entry.getResource() instanceof CodeSystem) {
                        CodeSystem cs = (CodeSystem) entry.getResource();
                        this.codeSystems.put(cs.getUrl(),cs);
                    }
                }
                if (bundle.getLink(Bundle.LINK_NEXT) != null) {
                    // load next page
                    log.info(bundle.getLink(Bundle.LINK_NEXT).getUrl());
                    try {
                        bundle = client.loadPage().next(bundle).execute();
                        more = true;
                    } catch (Exception ex) {
                        log.error(ex.getMessage());
                        more= false;
                    }
                }
            } while (more);
        }
        return codeSystems.values();
    }
    public Collection<ValueSet> getValueSets() {

        Bundle bundle = null;
        try {
            bundle = client.search()
                    .forResource(ValueSet.class)
                    .returnBundle(Bundle.class)
                    .execute();
        } catch (Exception ex1) {
            log.error(ex1.getMessage());
        }

        if (bundle != null && bundle.hasEntry()) {
            Boolean more;
            do {
                more=false;
                for (Bundle.BundleEntryComponent entry : bundle.getEntry()) {
                    log.info(entry.getFullUrl());
                    if (entry.getResource() instanceof ValueSet) {
                        ValueSet vs = (ValueSet) entry.getResource();
                        this.valueSets.put(vs.getUrl(),vs);
                    }
                }
                if (bundle.getLink(Bundle.LINK_NEXT) != null) {
                    // load next page
                    log.info(bundle.getLink(Bundle.LINK_NEXT).getUrl());
                    try {
                        bundle = client.loadPage().next(bundle).execute();
                        more = true;
                    } catch (Exception ex) {
                        log.error(ex.getMessage());
                        more= false;
                    }
                }
            } while (more);
        }
        return valueSets.values();
    }
}
