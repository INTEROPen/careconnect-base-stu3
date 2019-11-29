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
   // private String group;

    private Map<String, Resource> resources =  new HashMap<>();

    private IGenericClient client;

    FhirContext ctxFHIR = FhirContext.forDstu3();

    private static Logger log = LoggerFactory
            .getLogger(ProcessReferenceServer.class);

    public ProcessReferenceServer(String _serverUrl) {
        this.serverUrl = _serverUrl;
       // this.group = _group;
        this.client = ctxFHIR.newRestfulGenericClient(serverUrl);
        this.client.setEncoding(EncodingEnum.JSON);
    }

    public void populateMap() {
        getStructureDefinitions();
        getValueSets();
        getCodeSystems();
    }

    public Map<String, Resource> getResources() {
        return resources;
    }

    public void setResources(Map<String, Resource> resources) {
        this.resources = resources;
    }

    public void getStructureDefinitions() {

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
                        this.addMapEntry(sd.getUrl(),sd);
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

    }
    public void getCodeSystems() {

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
                        this.addMapEntry(cs.getUrl(),cs);
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

    }
    public void getValueSets() {

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
                        this.addMapEntry(vs.getUrl(),vs);
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
    }

    private void addMapEntry(String url, Resource resource) {
        String[] urlParse = url.split("/");
        String newUrl = urlParse[urlParse.length-1];
        newUrl = newUrl.replace("CareConnect-","").replace("Extension-","");
        if (this.resources.get(newUrl) != null) {
            if (resource instanceof CodeSystem) {
                newUrl = "cs-"+newUrl;
            }
            if (resource instanceof ValueSet) {
                newUrl = "vs-"+newUrl;
            }
        }

        this.resources.put(newUrl,resource);
    }

}
