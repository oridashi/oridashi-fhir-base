@echo off 

echo You have to edit the path to the publisher...
pause
"C:\Program Files (x86)\Java\jre1.8.0_144\bin\java.exe" -Xmx1024m -jar "..\au-fhir-base\org.hl7.fhir.igpublisher.jar" -ig ig.json

pause
