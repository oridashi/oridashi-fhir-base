<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/defs">
		<xsl:apply-templates select="def"/>
		<resources>
			<xsl:for-each select="def">
				<resource>
					<example value="false"/>
					<sourceReference>
						<xsl:element name="reference">
							<xsl:attribute name="value">StructureDefinition/oridashi-observation-<xsl:value-of select="@id"/></xsl:attribute>
						</xsl:element>
					</sourceReference>
				</resource>
			</xsl:for-each>
		</resources>
	</xsl:template>
	<xsl:template match="def">
		<xsl:variable name="fname" select="@id"/>
		<xsl:result-document href="gen-pages/oridashi-observation-{$fname}-intro.md" method="text">
Observation profile for basic observation/result for <xsl:value-of select="@Display"/> (LOINC <xsl:value-of select="@Code"/>)
		</xsl:result-document>
		<xsl:result-document href="gen-pages/oridashi-observation-{$fname}-summary.md" method="text">1. Base Resource: <xsl:value-of select="@Display"/> (as Observation)
1. Required: <xsl:value-of select="@Display"/> code - LOINC <xsl:value-of select="@Code"/> (as CodeableConcept)
1. Required: subject of care (as Reference(Patient))
1. Required: <xsl:value-of select="@Display"/> value  <xsl:if test="@units!=''"> - units <xsl:value-of select="@units"/>
			</xsl:if> (as Quantity)
		</xsl:result-document>
		<xsl:result-document href="gen-pages/oridashi-observation-{$fname}-search.md" method="text">
Oridashi Observation <xsl:value-of select="@Display"/> Search

-----------
**Read: Observation by Resource Identifier **

`GET [base]/Observation/[id]`

*Example:* 
`GET [base]/1-443`

*Implementation Notes:*  [(how to search by token)]

-----------
**Search: Observation by Code **

`GET [base]/Observation?code=[code]|[system]

*Example:* 
`GET [base]/PractitionerRole?code=<xsl:attribute name="value"><xsl:value-of select="@Code"/></xsl:attribute>|<xsl:attribute name="value"><xsl:value-of select="@System"/></xsl:attribute>

*Support* Mandatory to support search by Practitioner family and or given name.

*Implementation Notes:*  [(how to search by string)]

* Chained search (via Practitioner) based on text name.
* Can _include details of managing organisation, endpoints and location by adding 
`&amp;_include=PractitionerRole:organization&amp;_include=PractitionerRole:endpoint&amp;_include=PractitionerRole:location`	

-----------
 [(how to search by reference)]: http://hl7.org/fhir/search.html#reference
 [(how to search by token)]: http://hl7.org/fhir/search.html#token
 [(how to search by date)]: http://hl7.org/fhir/search.html#date
 [(how to search by string)]: http://hl7.org/fhir/search.html#string
			
		</xsl:result-document>
		<xsl:result-document href="gen-resources/oridashi-observation-{$fname}.xml" method="xml">
			<StructureDefinition xmlns="http://hl7.org/fhir">
				<xsl:element name="id">
					<xsl:attribute name="value">oridashi-observation-<xsl:value-of select="@id"/></xsl:attribute>
				</xsl:element>
				<meta>
					<lastUpdated value="2017-08-13T12:26:43.976+10:00"/>
				</meta>
				<text>
					<status value="generated"/>
					<div xmlns="http://www.w3.org/1999/xhtml">
						<p>
							<xsl:value-of select="@Display"/>
						</p>
					</div>
				</text>
				<xsl:element name="url">
					<xsl:attribute name="value">http://oridashi.com.au/fhir/StructureDefinition/oridashi-observation-<xsl:value-of select="@id"/></xsl:attribute>
				</xsl:element>
				<xsl:element name="name">
					<xsl:attribute name="value">Oridashi Observation <xsl:value-of select="@Display"/></xsl:attribute>
				</xsl:element>
				<xsl:element name="title">
					<xsl:attribute name="value">Oridashi Observation <xsl:value-of select="@Display"/></xsl:attribute>
				</xsl:element>
				<status value="draft"/>
				<date value="2017-08-13T12:18:24.372+10:00"/>
				<fhirVersion value="3.0.1"/>
				<kind value="resource"/>
				<abstract value="false"/>
				<type value="Observation"/>
				<baseDefinition value="http://oridashi.com.au/fhir/StructureDefinition/oridashi-observation"/>
				<derivation value="constraint"/>
				<differential>
					<element id="Observation">
						<path value="Observation"/>
					</element>
					<element id="Observation.code">
						<path value="Observation.code"/>
					</element>
					<element id="Observation.code.coding">
						<path value="Observation.code.coding"/>
						<min value="1"/>
						<max value="1"/>
						<fixedCoding>
							<xsl:element name="system">
								<xsl:attribute name="value"><xsl:value-of select="@System"/></xsl:attribute>
							</xsl:element>
							<xsl:element name="code">
								<xsl:attribute name="value"><xsl:value-of select="@Code"/></xsl:attribute>
							</xsl:element>
							<xsl:element name="display">
								<xsl:attribute name="value"><xsl:value-of select="@Display"/></xsl:attribute>
							</xsl:element>
						</fixedCoding>
					</element>
					<element id="Observation.code.text">
						<path value="Observation.code.text"/>
						<min value="1"/>
						<xsl:element name="fixedString">
							<xsl:attribute name="value"><xsl:value-of select="@Display"/></xsl:attribute>
						</xsl:element>
					</element>
					<xsl:if test="@dtype='Quantity'">
						<element id="Observation.value[x]:valueQuantity">
							<path value="Observation.valueQuantity"/>
							<sliceName value="valueQuantity"/>
							<min value="1"/>
							<type>
								<code value="Quantity"/>
							</type>
						</element>
						<xsl:if test="@units!=''">
							<element id="Observation.value[x]:valueQuantity.unit">
								<path value="Observation.valueQuantity.unit"/>
								<min value="1"/>
								<xsl:element name="fixedString">
									<xsl:attribute name="value"><xsl:value-of select="@units"/></xsl:attribute>
								</xsl:element>
							</element>
							<xsl:if test="@stdunits!=''">
								<element id="Observation.value[x]:valueQuantity.system">
									<path value="Observation.valueQuantity.system"/>
									<min value="1"/>
									<fixedUri value="http://unitsofmeasure.org"/>
								</element>
								<element id="Observation.value[x]:valueQuantity.code">
									<path value="Observation.valueQuantity.code"/>
									<min value="1"/>
									<xsl:element name="fixedCode">
										<xsl:attribute name="value"><xsl:value-of select="@units"/></xsl:attribute>
									</xsl:element>
								</element>
							</xsl:if>
						</xsl:if>
					</xsl:if>
					<xsl:if test="@dtype='CodeableConcept'">
						<element id="Observation.value[x]:valueCodeableConcept">
							<path value="Observation.valueCodeableConcept"/>
							<sliceName value="valueCodeableConcept"/>
							<min value="1"/>
							<type>
								<code value="CodeableConcept"/>
							</type>
							<xsl:if test="@ValueSet!=''">
								<binding>
									<strength value="required"/>
									<xsl:element name="valueSetUri">
										<xsl:attribute name="value"><xsl:value-of select="@ValueSet"/></xsl:attribute>
									</xsl:element>
								</binding>
							</xsl:if>
						</element>
					</xsl:if>
				</differential>
			</StructureDefinition>
		</xsl:result-document>
	</xsl:template>
</xsl:stylesheet>
