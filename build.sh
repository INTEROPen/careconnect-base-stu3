rm -r docs
JAVA -jar input-cache/org.hl7.fhir.publisher.jar -ig ig.ini
mv output docs