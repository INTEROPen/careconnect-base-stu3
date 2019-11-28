<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile MedicationDispense
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>MedicationDispense</sch:title>
    <sch:rule context="f:MedicationDispense">
      <sch:assert test="not(parent::f:contained and f:contained)">If the resource is contained in another resource, it SHALL NOT contain nested Resources</sch:assert>
      <sch:assert test="not(parent::f:contained and f:text)">If the resource is contained in another resource, it SHALL NOT contain any narrative</sch:assert>
      <sch:assert test="not(exists(f:contained/*/f:meta/f:versionId)) and not(exists(f:contained/*/f:meta/f:lastUpdated))">If a resource is contained in another resource, it SHALL NOT have a meta.versionId or a meta.lastUpdated</sch:assert>
      <sch:assert test="not(exists(for $id in f:contained/*/@id return $id[not(ancestor::f:contained/parent::*/descendant::f:reference/@value=concat('#', $id))]))">If the resource is contained in another resource, it SHALL be referred to from elsewhere in the resource</sch:assert>
      <sch:assert test="not(exists(f:whenHandedOver/@value)) or not(exists(f:whenPrepared/@value)) or ( f:whenHandedOver/@value &gt;= f:whenPrepared/@value)">whenHandedOver cannot be before whenPrepared</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.meta</sch:title>
    <sch:rule context="f:MedicationDispense/f:meta">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.implicitRules</sch:title>
    <sch:rule context="f:MedicationDispense/f:implicitRules">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.language</sch:title>
    <sch:rule context="f:MedicationDispense/f:language">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.text</sch:title>
    <sch:rule context="f:MedicationDispense/f:text">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.modifierExtension</sch:title>
    <sch:rule context="f:MedicationDispense/f:modifierExtension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:identifier</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:use) &lt;= 1">use: maximum cardinality of 'use' is 1</sch:assert>
      <sch:assert test="count(f:type) &lt;= 1">type: maximum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:system) &gt;= 1">system: minimum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:value) &gt;= 1">value: minimum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:period) &lt;= 1">period: maximum cardinality of 'period' is 1</sch:assert>
      <sch:assert test="count(f:assigner) &lt;= 1">assigner: maximum cardinality of 'assigner' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.use</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:use">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:identifier/f:type</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:type">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.type</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:type">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.type.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:type/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.type.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:type/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:identifier/f:type/f:coding</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:type/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.type.coding</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:type/f:coding">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.type.coding.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:type/f:coding/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.type.coding.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:type/f:coding/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.type.coding.system</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:type/f:coding/f:system">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.type.coding.version</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:type/f:coding/f:version">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.type.coding.code</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:type/f:coding/f:code">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.type.coding.display</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:type/f:coding/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.type.coding.userSelected</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:type/f:coding/f:userSelected">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.type.text</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:type/f:text">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.system</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:system">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.value</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:value">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:identifier/f:period</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:period">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:start) &lt;= 1">start: maximum cardinality of 'start' is 1</sch:assert>
      <sch:assert test="count(f:end) &lt;= 1">end: maximum cardinality of 'end' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.period</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:period">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(exists(f:start)) or not(exists(f:end)) or (f:start/@value &lt;= f:end/@value)">If present, start SHALL have a lower value than end</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.period.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:period/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.period.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:period/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.period.start</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:period/f:start">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.period.end</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:period/f:end">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:identifier/f:assigner</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:assigner">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.assigner</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:assigner">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">SHALL have a contained resource if a local reference is provided</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.assigner.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:assigner/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.assigner.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:assigner/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.assigner.reference</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:assigner/f:reference">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.assigner.identifier</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:assigner/f:identifier">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.identifier.assigner.display</sch:title>
    <sch:rule context="f:MedicationDispense/f:identifier/f:assigner/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:partOf</sch:title>
    <sch:rule context="f:MedicationDispense/f:partOf">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.partOf</sch:title>
    <sch:rule context="f:MedicationDispense/f:partOf">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">SHALL have a contained resource if a local reference is provided</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.partOf.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:partOf/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.partOf.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:partOf/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.partOf.reference</sch:title>
    <sch:rule context="f:MedicationDispense/f:partOf/f:reference">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.partOf.identifier</sch:title>
    <sch:rule context="f:MedicationDispense/f:partOf/f:identifier">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.partOf.display</sch:title>
    <sch:rule context="f:MedicationDispense/f:partOf/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.status</sch:title>
    <sch:rule context="f:MedicationDispense/f:status">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:category</sch:title>
    <sch:rule context="f:MedicationDispense/f:category">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.category</sch:title>
    <sch:rule context="f:MedicationDispense/f:category">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.category.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:category/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.category.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:category/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:category/f:coding</sch:title>
    <sch:rule context="f:MedicationDispense/f:category/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.category.coding</sch:title>
    <sch:rule context="f:MedicationDispense/f:category/f:coding">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.category.coding.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:category/f:coding/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.category.coding.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:category/f:coding/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.category.coding.system</sch:title>
    <sch:rule context="f:MedicationDispense/f:category/f:coding/f:system">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.category.coding.version</sch:title>
    <sch:rule context="f:MedicationDispense/f:category/f:coding/f:version">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.category.coding.code</sch:title>
    <sch:rule context="f:MedicationDispense/f:category/f:coding/f:code">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.category.coding.display</sch:title>
    <sch:rule context="f:MedicationDispense/f:category/f:coding/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.category.coding.userSelected</sch:title>
    <sch:rule context="f:MedicationDispense/f:category/f:coding/f:userSelected">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.category.text</sch:title>
    <sch:rule context="f:MedicationDispense/f:category/f:text">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.medicationReference</sch:title>
    <sch:rule context="f:MedicationDispense/f:medicationReference">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:subject</sch:title>
    <sch:rule context="f:MedicationDispense/f:subject">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.subject</sch:title>
    <sch:rule context="f:MedicationDispense/f:subject">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">SHALL have a contained resource if a local reference is provided</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.subject.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:subject/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.subject.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:subject/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.subject.reference</sch:title>
    <sch:rule context="f:MedicationDispense/f:subject/f:reference">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.subject.identifier</sch:title>
    <sch:rule context="f:MedicationDispense/f:subject/f:identifier">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.subject.display</sch:title>
    <sch:rule context="f:MedicationDispense/f:subject/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:context</sch:title>
    <sch:rule context="f:MedicationDispense/f:context">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.context</sch:title>
    <sch:rule context="f:MedicationDispense/f:context">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">SHALL have a contained resource if a local reference is provided</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.context.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:context/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.context.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:context/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.context.reference</sch:title>
    <sch:rule context="f:MedicationDispense/f:context/f:reference">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.context.identifier</sch:title>
    <sch:rule context="f:MedicationDispense/f:context/f:identifier">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.context.display</sch:title>
    <sch:rule context="f:MedicationDispense/f:context/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:supportingInformation</sch:title>
    <sch:rule context="f:MedicationDispense/f:supportingInformation">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.supportingInformation</sch:title>
    <sch:rule context="f:MedicationDispense/f:supportingInformation">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">SHALL have a contained resource if a local reference is provided</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.supportingInformation.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:supportingInformation/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.supportingInformation.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:supportingInformation/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.supportingInformation.reference</sch:title>
    <sch:rule context="f:MedicationDispense/f:supportingInformation/f:reference">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.supportingInformation.identifier</sch:title>
    <sch:rule context="f:MedicationDispense/f:supportingInformation/f:identifier">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.supportingInformation.display</sch:title>
    <sch:rule context="f:MedicationDispense/f:supportingInformation/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.performer</sch:title>
    <sch:rule context="f:MedicationDispense/f:performer">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.performer.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:performer/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.performer.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:performer/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.performer.modifierExtension</sch:title>
    <sch:rule context="f:MedicationDispense/f:performer/f:modifierExtension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:performer/f:actor</sch:title>
    <sch:rule context="f:MedicationDispense/f:performer/f:actor">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.performer.actor</sch:title>
    <sch:rule context="f:MedicationDispense/f:performer/f:actor">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">SHALL have a contained resource if a local reference is provided</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.performer.actor.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:performer/f:actor/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.performer.actor.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:performer/f:actor/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.performer.actor.reference</sch:title>
    <sch:rule context="f:MedicationDispense/f:performer/f:actor/f:reference">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.performer.actor.identifier</sch:title>
    <sch:rule context="f:MedicationDispense/f:performer/f:actor/f:identifier">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.performer.actor.display</sch:title>
    <sch:rule context="f:MedicationDispense/f:performer/f:actor/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:performer/f:onBehalfOf</sch:title>
    <sch:rule context="f:MedicationDispense/f:performer/f:onBehalfOf">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.performer.onBehalfOf</sch:title>
    <sch:rule context="f:MedicationDispense/f:performer/f:onBehalfOf">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">SHALL have a contained resource if a local reference is provided</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.performer.onBehalfOf.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:performer/f:onBehalfOf/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.performer.onBehalfOf.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:performer/f:onBehalfOf/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.performer.onBehalfOf.reference</sch:title>
    <sch:rule context="f:MedicationDispense/f:performer/f:onBehalfOf/f:reference">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.performer.onBehalfOf.identifier</sch:title>
    <sch:rule context="f:MedicationDispense/f:performer/f:onBehalfOf/f:identifier">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.performer.onBehalfOf.display</sch:title>
    <sch:rule context="f:MedicationDispense/f:performer/f:onBehalfOf/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:authorizingPrescription</sch:title>
    <sch:rule context="f:MedicationDispense/f:authorizingPrescription">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.authorizingPrescription</sch:title>
    <sch:rule context="f:MedicationDispense/f:authorizingPrescription">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">SHALL have a contained resource if a local reference is provided</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.authorizingPrescription.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:authorizingPrescription/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.authorizingPrescription.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:authorizingPrescription/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.authorizingPrescription.reference</sch:title>
    <sch:rule context="f:MedicationDispense/f:authorizingPrescription/f:reference">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.authorizingPrescription.identifier</sch:title>
    <sch:rule context="f:MedicationDispense/f:authorizingPrescription/f:identifier">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.authorizingPrescription.display</sch:title>
    <sch:rule context="f:MedicationDispense/f:authorizingPrescription/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:type</sch:title>
    <sch:rule context="f:MedicationDispense/f:type">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.type</sch:title>
    <sch:rule context="f:MedicationDispense/f:type">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.type.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:type/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.type.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:type/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:type/f:coding</sch:title>
    <sch:rule context="f:MedicationDispense/f:type/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.type.coding</sch:title>
    <sch:rule context="f:MedicationDispense/f:type/f:coding">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.type.coding.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:type/f:coding/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.type.coding.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:type/f:coding/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.type.coding.system</sch:title>
    <sch:rule context="f:MedicationDispense/f:type/f:coding/f:system">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.type.coding.version</sch:title>
    <sch:rule context="f:MedicationDispense/f:type/f:coding/f:version">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.type.coding.code</sch:title>
    <sch:rule context="f:MedicationDispense/f:type/f:coding/f:code">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.type.coding.display</sch:title>
    <sch:rule context="f:MedicationDispense/f:type/f:coding/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.type.coding.userSelected</sch:title>
    <sch:rule context="f:MedicationDispense/f:type/f:coding/f:userSelected">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.type.text</sch:title>
    <sch:rule context="f:MedicationDispense/f:type/f:text">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:quantity</sch:title>
    <sch:rule context="f:MedicationDispense/f:quantity">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-MedicationQuantityText-1']) &lt;= 1">extension with URL = 'https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-MedicationQuantityText-1': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 0">comparator: maximum cardinality of 'comparator' is 0</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 1">unit: maximum cardinality of 'unit' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.quantity</sch:title>
    <sch:rule context="f:MedicationDispense/f:quantity">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(exists(f:code)) or exists(f:system)">If a code for the unit is present, the system SHALL also be present</sch:assert>
      <sch:assert test="not(exists(f:comparator))">The comparator is not used on a SimpleQuantity</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.quantity.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:quantity/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.quantity.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:quantity/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.quantity.value</sch:title>
    <sch:rule context="f:MedicationDispense/f:quantity/f:value">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.quantity.comparator</sch:title>
    <sch:rule context="f:MedicationDispense/f:quantity/f:comparator">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.quantity.unit</sch:title>
    <sch:rule context="f:MedicationDispense/f:quantity/f:unit">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.quantity.system</sch:title>
    <sch:rule context="f:MedicationDispense/f:quantity/f:system">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.quantity.code</sch:title>
    <sch:rule context="f:MedicationDispense/f:quantity/f:code">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:daysSupply</sch:title>
    <sch:rule context="f:MedicationDispense/f:daysSupply">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 0">comparator: maximum cardinality of 'comparator' is 0</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 1">unit: maximum cardinality of 'unit' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.daysSupply</sch:title>
    <sch:rule context="f:MedicationDispense/f:daysSupply">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(exists(f:code)) or exists(f:system)">If a code for the unit is present, the system SHALL also be present</sch:assert>
      <sch:assert test="not(exists(f:comparator))">The comparator is not used on a SimpleQuantity</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.daysSupply.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:daysSupply/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.daysSupply.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:daysSupply/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.daysSupply.value</sch:title>
    <sch:rule context="f:MedicationDispense/f:daysSupply/f:value">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.daysSupply.comparator</sch:title>
    <sch:rule context="f:MedicationDispense/f:daysSupply/f:comparator">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.daysSupply.unit</sch:title>
    <sch:rule context="f:MedicationDispense/f:daysSupply/f:unit">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.daysSupply.system</sch:title>
    <sch:rule context="f:MedicationDispense/f:daysSupply/f:system">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.daysSupply.code</sch:title>
    <sch:rule context="f:MedicationDispense/f:daysSupply/f:code">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.whenPrepared</sch:title>
    <sch:rule context="f:MedicationDispense/f:whenPrepared">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.whenHandedOver</sch:title>
    <sch:rule context="f:MedicationDispense/f:whenHandedOver">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:destination</sch:title>
    <sch:rule context="f:MedicationDispense/f:destination">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.destination</sch:title>
    <sch:rule context="f:MedicationDispense/f:destination">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">SHALL have a contained resource if a local reference is provided</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.destination.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:destination/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.destination.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:destination/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.destination.reference</sch:title>
    <sch:rule context="f:MedicationDispense/f:destination/f:reference">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.destination.identifier</sch:title>
    <sch:rule context="f:MedicationDispense/f:destination/f:identifier">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.destination.display</sch:title>
    <sch:rule context="f:MedicationDispense/f:destination/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:receiver</sch:title>
    <sch:rule context="f:MedicationDispense/f:receiver">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.receiver</sch:title>
    <sch:rule context="f:MedicationDispense/f:receiver">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">SHALL have a contained resource if a local reference is provided</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.receiver.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:receiver/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.receiver.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:receiver/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.receiver.reference</sch:title>
    <sch:rule context="f:MedicationDispense/f:receiver/f:reference">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.receiver.identifier</sch:title>
    <sch:rule context="f:MedicationDispense/f:receiver/f:identifier">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.receiver.display</sch:title>
    <sch:rule context="f:MedicationDispense/f:receiver/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:note</sch:title>
    <sch:rule context="f:MedicationDispense/f:note">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:author[x]) &lt;= 1">author[x]: maximum cardinality of 'author[x]' is 1</sch:assert>
      <sch:assert test="count(f:time) &lt;= 1">time: maximum cardinality of 'time' is 1</sch:assert>
      <sch:assert test="count(f:text) &gt;= 1">text: minimum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.note</sch:title>
    <sch:rule context="f:MedicationDispense/f:note">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.note.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:note/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.note.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:note/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.note.author[x] 1</sch:title>
    <sch:rule context="f:MedicationDispense/f:note/f:author[x]">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">SHALL have a contained resource if a local reference is provided</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.note.time</sch:title>
    <sch:rule context="f:MedicationDispense/f:note/f:time">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.note.text</sch:title>
    <sch:rule context="f:MedicationDispense/f:note/f:text">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:dosageInstruction</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:sequence) &lt;= 1">sequence: maximum cardinality of 'sequence' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:patientInstruction) &lt;= 1">patientInstruction: maximum cardinality of 'patientInstruction' is 1</sch:assert>
      <sch:assert test="count(f:timing) &lt;= 1">timing: maximum cardinality of 'timing' is 1</sch:assert>
      <sch:assert test="count(f:asNeeded[x]) &lt;= 1">asNeeded[x]: maximum cardinality of 'asNeeded[x]' is 1</sch:assert>
      <sch:assert test="count(f:site) &lt;= 1">site: maximum cardinality of 'site' is 1</sch:assert>
      <sch:assert test="count(f:route) &lt;= 1">route: maximum cardinality of 'route' is 1</sch:assert>
      <sch:assert test="count(f:method) &lt;= 1">method: maximum cardinality of 'method' is 1</sch:assert>
      <sch:assert test="count(f:dose[x]) &lt;= 1">dose[x]: maximum cardinality of 'dose[x]' is 1</sch:assert>
      <sch:assert test="count(f:maxDosePerPeriod) &lt;= 1">maxDosePerPeriod: maximum cardinality of 'maxDosePerPeriod' is 1</sch:assert>
      <sch:assert test="count(f:maxDosePerAdministration) &lt;= 1">maxDosePerAdministration: maximum cardinality of 'maxDosePerAdministration' is 1</sch:assert>
      <sch:assert test="count(f:maxDosePerLifetime) &lt;= 1">maxDosePerLifetime: maximum cardinality of 'maxDosePerLifetime' is 1</sch:assert>
      <sch:assert test="count(f:rate[x]) &lt;= 1">rate[x]: maximum cardinality of 'rate[x]' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.sequence</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:sequence">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.text</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:text">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:dosageInstruction/f:additionalInstruction</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:additionalInstruction">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.additionalInstruction</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:additionalInstruction">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.additionalInstruction.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:additionalInstruction/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.additionalInstruction.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:additionalInstruction/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:dosageInstruction/f:additionalInstruction/f:coding</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:additionalInstruction/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.additionalInstruction.coding</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:additionalInstruction/f:coding">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.additionalInstruction.coding.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:additionalInstruction/f:coding/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.additionalInstruction.coding.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:additionalInstruction/f:coding/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.additionalInstruction.coding.system</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:additionalInstruction/f:coding/f:system">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.additionalInstruction.coding.version</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:additionalInstruction/f:coding/f:version">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.additionalInstruction.coding.code</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:additionalInstruction/f:coding/f:code">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.additionalInstruction.coding.display</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:additionalInstruction/f:coding/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.additionalInstruction.coding.userSelected</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:additionalInstruction/f:coding/f:userSelected">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.additionalInstruction.text</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:additionalInstruction/f:text">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.patientInstruction</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:patientInstruction">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:dosageInstruction/f:timing</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:repeat) &lt;= 1">repeat: maximum cardinality of 'repeat' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.event</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:event">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:dosageInstruction/f:timing/f:repeat</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:repeat">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:bounds[x]) &lt;= 1">bounds[x]: maximum cardinality of 'bounds[x]' is 1</sch:assert>
      <sch:assert test="count(f:count) &lt;= 1">count: maximum cardinality of 'count' is 1</sch:assert>
      <sch:assert test="count(f:countMax) &lt;= 1">countMax: maximum cardinality of 'countMax' is 1</sch:assert>
      <sch:assert test="count(f:duration) &lt;= 1">duration: maximum cardinality of 'duration' is 1</sch:assert>
      <sch:assert test="count(f:durationMax) &lt;= 1">durationMax: maximum cardinality of 'durationMax' is 1</sch:assert>
      <sch:assert test="count(f:durationUnit) &lt;= 1">durationUnit: maximum cardinality of 'durationUnit' is 1</sch:assert>
      <sch:assert test="count(f:frequency) &lt;= 1">frequency: maximum cardinality of 'frequency' is 1</sch:assert>
      <sch:assert test="count(f:frequencyMax) &lt;= 1">frequencyMax: maximum cardinality of 'frequencyMax' is 1</sch:assert>
      <sch:assert test="count(f:period) &lt;= 1">period: maximum cardinality of 'period' is 1</sch:assert>
      <sch:assert test="count(f:periodMax) &lt;= 1">periodMax: maximum cardinality of 'periodMax' is 1</sch:assert>
      <sch:assert test="count(f:periodUnit) &lt;= 1">periodUnit: maximum cardinality of 'periodUnit' is 1</sch:assert>
      <sch:assert test="count(f:offset) &lt;= 1">offset: maximum cardinality of 'offset' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.repeat</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:repeat">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(exists(f:offset)) or exists(f:when)">If there's an offset, there must be a when (and not C, CM, CD, CV)</sch:assert>
      <sch:assert test="f:period/@value &gt;= 0 or not(f:period/@value)">period SHALL be a non-negative value</sch:assert>
      <sch:assert test="not(exists(f:periodMax)) or exists(f:period)">If there's a periodMax, there must be a period</sch:assert>
      <sch:assert test="not(exists(f:durationMax)) or exists(f:duration)">If there's a durationMax, there must be a duration</sch:assert>
      <sch:assert test="not(exists(f:countMax)) or exists(f:count)">If there's a countMax, there must be a count</sch:assert>
      <sch:assert test="not(exists(f:duration)) or exists(f:durationUnit)">if there's a duration, there needs to be duration units</sch:assert>
      <sch:assert test="not(exists(f:timeOfDay)) or not(exists(f:when))">If there's a timeOfDay, there cannot be be a when, or vice versa</sch:assert>
      <sch:assert test="not(exists(f:period)) or exists(f:periodUnit)">if there's a period, there needs to be period units</sch:assert>
      <sch:assert test="f:duration/@value &gt;= 0 or not(f:duration/@value)">duration SHALL be a non-negative value</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.repeat.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:repeat/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.repeat.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:repeat/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.repeat.bounds[x] 1</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:repeat/f:bounds[x]">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(exists(f:code)) or exists(f:system)">If a code for the unit is present, the system SHALL also be present</sch:assert>
      <sch:assert test="(f:code or not(f:value)) and (not(exists(f:system)) or f:system/@value='http://unitsofmeasure.org')">There SHALL be a code if there is a value and it SHALL be an expression of time.  If system is present, it SHALL be UCUM.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.repeat.count</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:repeat/f:count">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.repeat.countMax</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:repeat/f:countMax">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.repeat.duration</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:repeat/f:duration">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.repeat.durationMax</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:repeat/f:durationMax">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.repeat.durationUnit</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:repeat/f:durationUnit">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.repeat.frequency</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:repeat/f:frequency">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.repeat.frequencyMax</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:repeat/f:frequencyMax">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.repeat.period</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:repeat/f:period">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.repeat.periodMax</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:repeat/f:periodMax">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.repeat.periodUnit</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:repeat/f:periodUnit">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.repeat.dayOfWeek</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:repeat/f:dayOfWeek">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.repeat.timeOfDay</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:repeat/f:timeOfDay">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.repeat.when</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:repeat/f:when">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.repeat.offset</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:repeat/f:offset">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:dosageInstruction/f:timing/f:code</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:code">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.code</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:code">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.code.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:code/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.code.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:code/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:dosageInstruction/f:timing/f:code/f:coding</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:code/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.code.coding</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:code/f:coding">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.code.coding.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:code/f:coding/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.code.coding.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:code/f:coding/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.code.coding.system</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:code/f:coding/f:system">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.code.coding.version</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:code/f:coding/f:version">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.code.coding.code</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:code/f:coding/f:code">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.code.coding.display</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:code/f:coding/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.code.coding.userSelected</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:code/f:coding/f:userSelected">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.timing.code.text</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:timing/f:code/f:text">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.asNeeded[x] 1</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:asNeeded[x]">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:dosageInstruction/f:site</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:site">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.site</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:site">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.site.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:site/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.site.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:site/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:dosageInstruction/f:site/f:coding</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:site/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.site.coding</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:site/f:coding">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.site.coding.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:site/f:coding/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.site.coding.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:site/f:coding/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.site.coding.system</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:site/f:coding/f:system">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.site.coding.version</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:site/f:coding/f:version">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.site.coding.code</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:site/f:coding/f:code">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.site.coding.display</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:site/f:coding/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.site.coding.userSelected</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:site/f:coding/f:userSelected">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.site.text</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:site/f:text">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:dosageInstruction/f:route</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:route">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.route</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:route">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.route.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:route/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.route.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:route/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:dosageInstruction/f:route/f:coding</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:route/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.route.coding</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:route/f:coding">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.route.coding.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:route/f:coding/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.route.coding.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:route/f:coding/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.route.coding.system</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:route/f:coding/f:system">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.route.coding.version</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:route/f:coding/f:version">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.route.coding.code</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:route/f:coding/f:code">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.route.coding.display</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:route/f:coding/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.route.coding.userSelected</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:route/f:coding/f:userSelected">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.route.text</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:route/f:text">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:dosageInstruction/f:method</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:method">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.method</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:method">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.method.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:method/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.method.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:method/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:dosageInstruction/f:method/f:coding</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:method/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.method.coding</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:method/f:coding">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.method.coding.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:method/f:coding/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.method.coding.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:method/f:coding/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.method.coding.system</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:method/f:coding/f:system">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.method.coding.version</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:method/f:coding/f:version">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.method.coding.code</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:method/f:coding/f:code">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.method.coding.display</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:method/f:coding/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.method.coding.userSelected</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:method/f:coding/f:userSelected">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.method.text</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:method/f:text">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.dose[x] 1</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:dose[x]">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(exists(f:low/f:value/@value)) or not(exists(f:high/f:value/@value)) or (number(f:low/f:value/@value) &lt;= number(f:high/f:value/@value))">If present, low SHALL have a lower value than high</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:numerator) &lt;= 1">numerator: maximum cardinality of 'numerator' is 1</sch:assert>
      <sch:assert test="count(f:denominator) &lt;= 1">denominator: maximum cardinality of 'denominator' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerPeriod</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="(count(f:numerator) = count(f:denominator)) and ((count(f:numerator) &gt; 0) or (count(f:extension) &gt; 0))">Numerator and denominator SHALL both be present, or both are absent. If both are absent, there SHALL be some extension present</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerPeriod.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerPeriod.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod/f:numerator</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod/f:numerator">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 1">comparator: maximum cardinality of 'comparator' is 1</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 1">unit: maximum cardinality of 'unit' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerPeriod.numerator</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod/f:numerator">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(exists(f:code)) or exists(f:system)">If a code for the unit is present, the system SHALL also be present</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerPeriod.numerator.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod/f:numerator/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerPeriod.numerator.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod/f:numerator/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerPeriod.numerator.value</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod/f:numerator/f:value">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerPeriod.numerator.comparator</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod/f:numerator/f:comparator">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerPeriod.numerator.unit</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod/f:numerator/f:unit">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerPeriod.numerator.system</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod/f:numerator/f:system">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerPeriod.numerator.code</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod/f:numerator/f:code">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod/f:denominator</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod/f:denominator">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 1">comparator: maximum cardinality of 'comparator' is 1</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 1">unit: maximum cardinality of 'unit' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerPeriod.denominator</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod/f:denominator">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(exists(f:code)) or exists(f:system)">If a code for the unit is present, the system SHALL also be present</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerPeriod.denominator.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod/f:denominator/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerPeriod.denominator.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod/f:denominator/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerPeriod.denominator.value</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod/f:denominator/f:value">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerPeriod.denominator.comparator</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod/f:denominator/f:comparator">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerPeriod.denominator.unit</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod/f:denominator/f:unit">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerPeriod.denominator.system</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod/f:denominator/f:system">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerPeriod.denominator.code</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerPeriod/f:denominator/f:code">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:dosageInstruction/f:maxDosePerAdministration</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerAdministration">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 0">comparator: maximum cardinality of 'comparator' is 0</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 1">unit: maximum cardinality of 'unit' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerAdministration</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerAdministration">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(exists(f:code)) or exists(f:system)">If a code for the unit is present, the system SHALL also be present</sch:assert>
      <sch:assert test="not(exists(f:comparator))">The comparator is not used on a SimpleQuantity</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerAdministration.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerAdministration/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerAdministration.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerAdministration/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerAdministration.value</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerAdministration/f:value">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerAdministration.comparator</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerAdministration/f:comparator">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerAdministration.unit</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerAdministration/f:unit">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerAdministration.system</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerAdministration/f:system">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerAdministration.code</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerAdministration/f:code">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:dosageInstruction/f:maxDosePerLifetime</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerLifetime">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 0">comparator: maximum cardinality of 'comparator' is 0</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 1">unit: maximum cardinality of 'unit' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerLifetime</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerLifetime">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(exists(f:code)) or exists(f:system)">If a code for the unit is present, the system SHALL also be present</sch:assert>
      <sch:assert test="not(exists(f:comparator))">The comparator is not used on a SimpleQuantity</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerLifetime.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerLifetime/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerLifetime.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerLifetime/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerLifetime.value</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerLifetime/f:value">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerLifetime.comparator</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerLifetime/f:comparator">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerLifetime.unit</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerLifetime/f:unit">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerLifetime.system</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerLifetime/f:system">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.maxDosePerLifetime.code</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:maxDosePerLifetime/f:code">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.dosageInstruction.rate[x] 1</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:rate[x]">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="(count(f:numerator) = count(f:denominator)) and ((count(f:numerator) &gt; 0) or (count(f:extension) &gt; 0))">Numerator and denominator SHALL both be present, or both are absent. If both are absent, there SHALL be some extension present</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.modifierExtension</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:modifierExtension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.wasSubstituted</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:wasSubstituted">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:substitution/f:type</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:type">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.type</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:type">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.type.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:type/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.type.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:type/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:substitution/f:type/f:coding</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:type/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.type.coding</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:type/f:coding">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.type.coding.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:type/f:coding/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.type.coding.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:type/f:coding/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.type.coding.system</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:type/f:coding/f:system">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.type.coding.version</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:type/f:coding/f:version">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.type.coding.code</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:type/f:coding/f:code">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.type.coding.display</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:type/f:coding/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.type.coding.userSelected</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:type/f:coding/f:userSelected">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.type.text</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:type/f:text">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:substitution/f:reason</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:reason">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.reason</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:reason">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.reason.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:reason/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.reason.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:reason/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:substitution/f:reason/f:coding</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:reason/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.reason.coding</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:reason/f:coding">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.reason.coding.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:reason/f:coding/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.reason.coding.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:reason/f:coding/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.reason.coding.system</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:reason/f:coding/f:system">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.reason.coding.version</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:reason/f:coding/f:version">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.reason.coding.code</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:reason/f:coding/f:code">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.reason.coding.display</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:reason/f:coding/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.reason.coding.userSelected</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:reason/f:coding/f:userSelected">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.reason.text</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:reason/f:text">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:substitution/f:responsibleParty</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:responsibleParty">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.responsibleParty</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:responsibleParty">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">SHALL have a contained resource if a local reference is provided</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.responsibleParty.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:responsibleParty/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.responsibleParty.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:responsibleParty/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.responsibleParty.reference</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:responsibleParty/f:reference">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.responsibleParty.identifier</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:responsibleParty/f:identifier">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.substitution.responsibleParty.display</sch:title>
    <sch:rule context="f:MedicationDispense/f:substitution/f:responsibleParty/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:detectedIssue</sch:title>
    <sch:rule context="f:MedicationDispense/f:detectedIssue">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.detectedIssue</sch:title>
    <sch:rule context="f:MedicationDispense/f:detectedIssue">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">SHALL have a contained resource if a local reference is provided</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.detectedIssue.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:detectedIssue/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.detectedIssue.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:detectedIssue/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.detectedIssue.reference</sch:title>
    <sch:rule context="f:MedicationDispense/f:detectedIssue/f:reference">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.detectedIssue.identifier</sch:title>
    <sch:rule context="f:MedicationDispense/f:detectedIssue/f:identifier">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.detectedIssue.display</sch:title>
    <sch:rule context="f:MedicationDispense/f:detectedIssue/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.notDone</sch:title>
    <sch:rule context="f:MedicationDispense/f:notDone">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.notDoneReason[x] 1</sch:title>
    <sch:rule context="f:MedicationDispense/f:notDoneReason[x]">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:eventHistory</sch:title>
    <sch:rule context="f:MedicationDispense/f:eventHistory">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.eventHistory</sch:title>
    <sch:rule context="f:MedicationDispense/f:eventHistory">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">SHALL have a contained resource if a local reference is provided</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.eventHistory.id</sch:title>
    <sch:rule context="f:MedicationDispense/f:eventHistory/f:id">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.eventHistory.extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:eventHistory/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.eventHistory.reference</sch:title>
    <sch:rule context="f:MedicationDispense/f:eventHistory/f:reference">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.eventHistory.identifier</sch:title>
    <sch:rule context="f:MedicationDispense/f:eventHistory/f:identifier">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationDispense.eventHistory.display</sch:title>
    <sch:rule context="f:MedicationDispense/f:eventHistory/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
