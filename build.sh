JAVA -jar input-cache/org.hl7.fhir.publisher.jar -ig ig.ini
rm -r docs
mv output docs
rm docs/assets/images/hl7-logo-header.png