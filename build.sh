JAVA -jar input-cache/org.hl7.fhir.publisher.jar -ig ig.ini -tool jekyll -destination docs
rm -r docs
rm output/*.md
mv output docs