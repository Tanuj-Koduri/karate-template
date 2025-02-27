Feature: API POST Request Test for Person Resource

Background:
    * url 'http://hapi-fhir.ptg-poc.com:8080/fhir'

Scenario: Verify successful Person resource creation
    * path 'Person'
    * request
    """
    {
      "resourceType": "Person",
      "active": true,
      "name": [
        {
          "use": "official",
          "family": "Smith",
          "given": ["John"]
        }
      ],
      "gender": "male",
      "birthDate": "1990-01-01"
    }
    """
    * method POST
    * status 201
    * print 'Create Person Response:', response
    * def existingResourceId = response.id
    * match response.resourceType == 'Person'
    * match response.name[0].family == 'Smith'
    * match response.name[0].given[0] == 'John'
    * match response.gender == 'male'
    * match response.birthDate == '1990-01-01'