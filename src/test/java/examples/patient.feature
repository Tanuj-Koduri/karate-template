Feature: API GET Request Test for Patient Resource

Background:
    * url 'http://hapi-fhir.ptg-poc.com:8080/fhir/Patient'

Scenario Outline: Verify GET API Response for Patient - <id>
    Given path '<id>'
    * method GET
    * status 200
    * match response.resourceType == 'Patient'
    * match response.id == '<id>'
    * match response.meta.source == '#? _ != null'

Examples:
    | id |
    | 9  |
    | 11 |