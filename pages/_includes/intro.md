## {{ page.title }}
{:.no_toc}

<!-- TOC -->

* Do not remove this line (it will not be displayed)
{:toc}

## Introduction
This guide describes the Oridashi-Hiasobi profiled interface to Australian primary care systems.

The interface is based on the [HL7 FHIR<sup>&reg;&copy;</sup> STU3](http://hl7.org/fhir/STU3/index.html) publication

## Usage

This document describes the profiles used when obtaining resource instances from the Oridashi-Hiasobi interface.

Specifically the following constraints in content and capability should be noted:

* Elements that are not provided in resource have been marked with a cardinality of 0..0
* The search section of each resource type describes the available search parameters supported
* Some clinical terminologies utilised are supplied by clinical systems themselves (as provided; no value sets defined)

Some of the profiles in this guide are based on the [Australian Base Profiles Implementation Guide](http://build.fhir.org/ig/hl7au/au-fhir-base/) Australian profiles.
Some of the profiles in this guide are based on the [HL7 FHIR<sup>&reg;&copy;</sup> STU3](http://hl7.org/fhir/STU3/index.html) base profiles.

NOTE: the ''differential'' display in profiles shows the CHANGES ONLY to be base parent profile; the ''snapshot'' display defines ALL the elements in the profile including base parent profile content.





