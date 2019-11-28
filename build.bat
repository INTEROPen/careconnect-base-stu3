JAVA -Xms64m -Xmx8g -jar input-cache/org.hl7.fhir.publisher.jar -ig ig.ini
rmdir /q /s docs
rename output docs